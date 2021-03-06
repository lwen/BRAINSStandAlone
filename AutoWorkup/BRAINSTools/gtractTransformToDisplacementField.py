from nipype.interfaces.base import CommandLine, CommandLineInputSpec, TraitedSpec, File, Directory, traits, isdefined, InputMultiPath, OutputMultiPath
import os
from nipype.interfaces.slicer.base import SlicerCommandLine


class gtractTransformToDisplacementFieldInputSpec(CommandLineInputSpec):
    inputTransform = File(desc="Input Transform File Name", exists=True, argstr="--inputTransform %s")
    inputReferenceVolume = File(desc="Required: input image file name to exemplify the anatomical space over which to vcl_express the transform as a displacement field.", exists=True, argstr="--inputReferenceVolume %s")
    outputDeformationFieldVolume = traits.Either(traits.Bool, File(), hash_files=False, desc="Output deformation field", argstr="--outputDeformationFieldVolume %s")
    numberOfThreads = traits.Int(desc="Explicitly specify the maximum number of threads to use.", argstr="--numberOfThreads %d")


class gtractTransformToDisplacementFieldOutputSpec(TraitedSpec):
    outputDeformationFieldVolume = File(desc="Output deformation field", exists=True)


class gtractTransformToDisplacementField(SlicerCommandLine):
    """title: Create Displacement Field

category: Diffusion.GTRACT

description: This program will compute forward deformation from the given Transform. The size of the DF is equal to MNI space

version: 4.0.0

documentation-url: http://wiki.slicer.org/slicerWiki/index.php/Modules:GTRACT

license: http://mri.radiology.uiowa.edu/copyright/GTRACT-Copyright.txt

contributor: This tool was developed by Vincent Magnotta, Madhura Ingalhalikar, and Greg Harris 

acknowledgements: Funding for this version of the GTRACT program was provided by NIH/NINDS R01NS050568-01A2S1

"""

    input_spec = gtractTransformToDisplacementFieldInputSpec
    output_spec = gtractTransformToDisplacementFieldOutputSpec
    _cmd = " gtractTransformToDisplacementField "
    _outputs_filenames = {'outputDeformationFieldVolume':'outputDeformationFieldVolume.nii'}
