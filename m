Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD6914F9D3
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712314784; cv=none; b=Q6mch8W3fwnEyQ9d+owICFQmhZDAd2EnIgMza2doPO9SfJdVgvw5ZQfNSd0VQhncy/bL37CpTfTA+yQ9iE9AhDKlkVtaiOdqdRyWrEP+2bk1C+uJYU+Tx/nHaj26LsEj430uvoCQQMxCRWeFA7fru3gLoc5N1VotSf2dol/8iJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712314784; c=relaxed/simple;
	bh=D8Y8kSPgdNQltZQgMyJDuKh4/mxZzHlrbAO8HfxrMCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kn6/zmH6k4lnDIRgOwq7gsRwZeh2fKFBDLG+JVaqtb9E87AxPIl90XwjfNZpJgyLcrEGYKIx2DL6+/SPLHnW4sMZ65MrjyT0WM5CjCIoyOYW90GacywahzsBpX8IcuEJgqV9oFPbWeMDHAOZ4TT7B+5E1tnho0QWmNn8sk+N4Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QON1ZqZQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QON1ZqZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712314782; x=1743850782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D8Y8kSPgdNQltZQgMyJDuKh4/mxZzHlrbAO8HfxrMCg=;
  b=QON1ZqZQeXofwhmhn/aknv+DNXyl0PRG3QL66nCuoghKgOp+LM1d5iB8
   iBsEbc+J1ii86uGxk9RnBNdqP/zTxtGJR/X2czl7kZMMgV0os3to/hiKu
   fm07jetmEK+pQr8Izdtq+Bri5eRUVL9btOzk9BjVNMteTZkzLHVpb4KMn
   byU6IZEETqsEtRaoVJjej3YQZ4PoZ+GiGSUa1UmuakkolAfFmaViHSxxC
   St9LbxHpscnGVf+0K0t44DHPpBdnKcUrGOSZFPGLcuD6lD2auQQbtBwdo
   RJXDSSoPuOVOM/pd+e5bHoErVfrcsDKmwGhHcPMGQfq1+iCvY/qqQVB38
   A==;
X-CSE-ConnectionGUID: 7Dwm008RSQSATn5BR3+lDw==
X-CSE-MsgGUID: L4DYtudCQYqsOL+i8WfBSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11431795"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="11431795"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 03:59:42 -0700
X-CSE-ConnectionGUID: IuMHpOWjTvq08bwRRgjn6A==
X-CSE-MsgGUID: 6/LVX0bqSlWd8NIDS/R2qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19579543"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 03:59:38 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 68C1311F8B1;
	Fri,  5 Apr 2024 13:59:35 +0300 (EEST)
Date: Fri, 5 Apr 2024 10:59:35 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Luigi311 <git@luigi311.com>
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pavel@ucw.cz, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 19/25] media: i2c: imx258: Change register settings
 for variants of the sensor
Message-ID: <Zg_Zl0Q2kEDJoQoe@kekkonen.localdomain>
References: <20240403150355.189229-1-git@luigi311.com>
 <20240403150355.189229-20-git@luigi311.com>
 <Zg2BZXQpzsm7jMnc@kekkonen.localdomain>
 <998efafa-699b-4226-91d4-2ebba85d63ec@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <998efafa-699b-4226-91d4-2ebba85d63ec@luigi311.com>

Hi Luis, Dave,

On Thu, Apr 04, 2024 at 04:44:05PM -0600, Luigi311 wrote:
> On 4/3/24 10:18, Sakari Ailus wrote:
> > Hi Luis, Dave,
> > 
> > On Wed, Apr 03, 2024 at 09:03:48AM -0600, git@luigi311.com wrote:
> >> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>
> >> Sony have advised that there are variants of the IMX258 sensor which
> >> require slightly different register configuration to the mainline
> >> imx258 driver defaults.
> >>
> >> There is no available run-time detection for the variant, so add
> >> configuration via the DT compatible string.
> >>
> >> The Vision Components imx258 module supports PDAF, so add the
> >> register differences for that variant
> >>
> >> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >> Signed-off-by: Luis Garcia <git@luigi311.com>
> >> ---
> >>  drivers/media/i2c/imx258.c | 48 ++++++++++++++++++++++++++++++++++----
> >>  1 file changed, 44 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> >> index 775d957c9b87..fa48da212037 100644
> >> --- a/drivers/media/i2c/imx258.c
> >> +++ b/drivers/media/i2c/imx258.c
> >> @@ -6,6 +6,7 @@
> >>  #include <linux/delay.h>
> >>  #include <linux/i2c.h>
> >>  #include <linux/module.h>
> >> +#include <linux/of_device.h>
> >>  #include <linux/pm_runtime.h>
> >>  #include <linux/regulator/consumer.h>
> >>  #include <media/v4l2-ctrls.h>
> >> @@ -321,8 +322,6 @@ static const struct imx258_reg mipi_642mbps_24mhz_4l[] = {
> >>  
> >>  static const struct imx258_reg mode_common_regs[] = {
> >>  	{ 0x3051, 0x00 },
> >> -	{ 0x3052, 0x00 },
> >> -	{ 0x4E21, 0x14 },
> >>  	{ 0x6B11, 0xCF },
> >>  	{ 0x7FF0, 0x08 },
> >>  	{ 0x7FF1, 0x0F },
> >> @@ -345,7 +344,6 @@ static const struct imx258_reg mode_common_regs[] = {
> >>  	{ 0x7FA8, 0x03 },
> >>  	{ 0x7FA9, 0xFE },
> >>  	{ 0x7B24, 0x81 },
> >> -	{ 0x7B25, 0x00 },
> >>  	{ 0x6564, 0x07 },
> >>  	{ 0x6B0D, 0x41 },
> >>  	{ 0x653D, 0x04 },
> >> @@ -460,6 +458,33 @@ static const struct imx258_reg mode_1048_780_regs[] = {
> >>  	{ 0x034F, 0x0C },
> >>  };
> >>  
> >> +struct imx258_variant_cfg {
> >> +	const struct imx258_reg *regs;
> >> +	unsigned int num_regs;
> >> +};
> >> +
> >> +static const struct imx258_reg imx258_cfg_regs[] = {
> >> +	{ 0x3052, 0x00 },
> >> +	{ 0x4E21, 0x14 },
> >> +	{ 0x7B25, 0x00 },
> >> +};
> >> +
> >> +static const struct imx258_variant_cfg imx258_cfg = {
> >> +	.regs = imx258_cfg_regs,
> >> +	.num_regs = ARRAY_SIZE(imx258_cfg_regs),
> >> +};
> >> +
> >> +static const struct imx258_reg imx258_pdaf_cfg_regs[] = {
> >> +	{ 0x3052, 0x01 },
> >> +	{ 0x4E21, 0x10 },
> >> +	{ 0x7B25, 0x01 },
> >> +};
> >> +
> >> +static const struct imx258_variant_cfg imx258_pdaf_cfg = {
> >> +	.regs = imx258_pdaf_cfg_regs,
> >> +	.num_regs = ARRAY_SIZE(imx258_pdaf_cfg_regs),
> >> +};
> >> +
> >>  static const char * const imx258_test_pattern_menu[] = {
> >>  	"Disabled",
> >>  	"Solid Colour",
> >> @@ -637,6 +662,8 @@ struct imx258 {
> >>  	struct v4l2_subdev sd;
> >>  	struct media_pad pad;
> >>  
> >> +	const struct imx258_variant_cfg *variant_cfg;
> >> +
> >>  	struct v4l2_ctrl_handler ctrl_handler;
> >>  	/* V4L2 Controls */
> >>  	struct v4l2_ctrl *link_freq;
> >> @@ -1104,6 +1131,14 @@ static int imx258_start_streaming(struct imx258 *imx258)
> >>  		return ret;
> >>  	}
> >>  
> >> +	ret = imx258_write_regs(imx258, imx258->variant_cfg->regs,
> >> +				imx258->variant_cfg->num_regs);
> >> +	if (ret) {
> >> +		dev_err(&client->dev, "%s failed to set variant config\n",
> >> +			__func__);
> >> +		return ret;
> >> +	}
> >> +
> >>  	ret = imx258_write_reg(imx258, IMX258_CLK_BLANK_STOP,
> >>  			       IMX258_REG_VALUE_08BIT,
> >>  			       imx258->csi2_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK ?
> >> @@ -1492,6 +1527,10 @@ static int imx258_probe(struct i2c_client *client)
> >>  
> >>  	imx258->csi2_flags = ep.bus.mipi_csi2.flags;
> >>  
> >> +	imx258->variant_cfg = of_device_get_match_data(&client->dev);
> > 
> > You'll also need to keep this working for ACPI based systems. I.e. in
> > practice remove "of_" prefix here and add the non-PDAF variant data to the
> > relevant ACPI ID list.
> > 
> 
> Removing of_ is easy enough and looking at all the other commits that make
> this change in other drivers I dont see anything else being done besides
> adding in the .data section that is down below for both imx258 and pdaf
> versions. Is that what you are referencing or is there some other place
> to add variant data to ACPI ID list?

Speaking of which---are you absolutely certain there are two variants of
this sensor? Many sensors that have a different pixel pattern (PDAF pixels
or a non-Bayer pattern) can produce Bayer data when condigured so. The fact
that you have differing register configuration for the PDAF and non-PDAF
cases suggests this may well be the case.

> 
> >> +	if (!imx258->variant_cfg)
> >> +		imx258->variant_cfg = &imx258_cfg;
> >> +
> >>  	/* Initialize subdev */
> >>  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
> >>  
> >> @@ -1579,7 +1618,8 @@ MODULE_DEVICE_TABLE(acpi, imx258_acpi_ids);
> >>  #endif
> >>  
> >>  static const struct of_device_id imx258_dt_ids[] = {
> >> -	{ .compatible = "sony,imx258" },
> >> +	{ .compatible = "sony,imx258", .data = &imx258_cfg },
> >> +	{ .compatible = "sony,imx258-pdaf", .data = &imx258_pdaf_cfg },
> >>  	{ /* sentinel */ }
> >>  };
> >>  MODULE_DEVICE_TABLE(of, imx258_dt_ids);
> > 
> 

-- 
Regards,

Sakari Ailus
