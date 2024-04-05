Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC8D1649DF
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712323011; cv=none; b=SdIILH42bCfy/725I5ndgyG7iCmbM2Eg/WHCfoJVrg4XBvw716OV4LId5ejDghcIBIN1P1oCgu/VeUoWXPUPVinxMlp6fuV0PEfEsy3y7iOK7enxPcJrSa+kmN4uCZYBKkw4APWaencPfhct5fSwJ70P8Wvxaw2fHTrVp2EuAu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712323011; c=relaxed/simple;
	bh=v+58sPjlJWwPhy9bXXhoEqmcsCKhB+tXkTf2JPX+wLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJM+ONSe4C4AryfQRUol9Bv+WfWE4xNBQskxJ2ZXzPufAio89JMPRpvrVvNAtyYLAz5+xyZ8/NS8tTof/4Ca3it99GmKqoZNoPpY8HCiSBz4Gc1ckm/0sS1fpKUaDIZCAmi/LVhhBO6Fltv//RflyBzNnObrHS6bGcGl5Ja1KL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=SahA+HJT; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="SahA+HJT"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-615053a5252so18896437b3.1
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1712323007; x=1712927807; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nm6GyRvyXdEHSXH68cKBfVuLP4/sYuxdrZ1b0Ijwf88=;
        b=SahA+HJTjGmbIeEeMxsU8N85NPAZAxHKyA1fnx/0LRk5CoxY83f4Z/d3So0l+GD7I+
         Bb+sHRWnrb3/aV7hSOEFCeWuP8dVdF+EPRXgisDDY7RtRtyZrVD7POxFdEaqzFSopFvt
         oCBjFPfs96kwsytHWDCuhvtPRpcKFGTxCGcSG6Z4UqyF/DCXgjcga8Z0CV04dSA5SvfK
         uCLnLwR1fnHDfenzZuCIJJGWEXId4ZR6RjQwYPgSbPjl87nGRPHT4b9L0I18X8OdH4Ep
         X91r46Z4Y3bgyKJrnpETwDwqqC6/HMlt+BY9HuxWu9+9kq+J2TThsV8s7P+FsIioeoNf
         Z0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712323007; x=1712927807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nm6GyRvyXdEHSXH68cKBfVuLP4/sYuxdrZ1b0Ijwf88=;
        b=Vhpb2XDhGP62ZgfFZ1QECIHjQ6aTLgFi+FVU+N34rtxxV9D4Q3BzGGB0P9CVtgSS0b
         umpMTZbJuitACUwbwE2DSGyirT56WTcYE3Qkhu2H0O2hmf5QKPKr9UaHhRbhzws4zvWx
         BCF7HxD2GB4qSNSdVJsEWumZTRfGAkYfgZhOPu51iTSSVWRHmTrm8I2my49HTQzoPLhX
         dyu8CIlDADxzhjAWxD3ATURdJAcCFSSyX6pEshppnoxKnSmlgtyO5lXslcJZMwOzOA1t
         lfQXtNj8lJsUknEXX8GFbCADueDH2ILzoI1gVJS0t4huXI10GI/8k7mX93GY85f1TKi7
         NLoA==
X-Forwarded-Encrypted: i=1; AJvYcCUlCiaWNu58a7ldspSNTKyFe/Zw8utda4qTcgY9/d2FicVD50/IcelXXt3fIf8nSPOlcSYOF2DMnQ8KkuMtwggmGzdu
X-Gm-Message-State: AOJu0Yz3ykcUu05GTOgafG2oX9854kkUf4OIOBust7mglpMXpgsFBiVU
	1GudUi3Flg9D/8JPAmwB1FRMIVzShWeUM4fL95A9s/0jOCH/1VBSw85VHtVReMwY+7yBD/c1uF/
	CCxHUVsQO00uTKlYsOuzvMyiKHeKQ8HgedDA3bA==
X-Google-Smtp-Source: AGHT+IGGzv5DKk7hAo4Ucod67oLXhZeqqbHJigGfmjUCeFcvZrRc6n7AxJVltV6Ks5AqvtIUIJpZwg7AecCIBUIZIpA=
X-Received: by 2002:a81:4304:0:b0:615:fd7:f4dc with SMTP id
 q4-20020a814304000000b006150fd7f4dcmr1711846ywa.21.1712323007377; Fri, 05 Apr
 2024 06:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240403150355.189229-1-git@luigi311.com> <20240403150355.189229-20-git@luigi311.com>
 <Zg2BZXQpzsm7jMnc@kekkonen.localdomain> <998efafa-699b-4226-91d4-2ebba85d63ec@luigi311.com>
 <Zg_Zl0Q2kEDJoQoe@kekkonen.localdomain>
In-Reply-To: <Zg_Zl0Q2kEDJoQoe@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 5 Apr 2024 14:16:31 +0100
Message-ID: <CAPY8ntDP-EPQK_d=5NeVM-ZTjfhtpYRq_y6PVSn9dRzxD5b1_A@mail.gmail.com>
Subject: Re: [PATCH v3 19/25] media: i2c: imx258: Change register settings for
 variants of the sensor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Luigi311 <git@luigi311.com>, linux-media@vger.kernel.org, 
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	pavel@ucw.cz, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Fri, 5 Apr 2024 at 11:59, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Luis, Dave,
>
> On Thu, Apr 04, 2024 at 04:44:05PM -0600, Luigi311 wrote:
> > On 4/3/24 10:18, Sakari Ailus wrote:
> > > Hi Luis, Dave,
> > >
> > > On Wed, Apr 03, 2024 at 09:03:48AM -0600, git@luigi311.com wrote:
> > >> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >>
> > >> Sony have advised that there are variants of the IMX258 sensor which
> > >> require slightly different register configuration to the mainline
> > >> imx258 driver defaults.
> > >>
> > >> There is no available run-time detection for the variant, so add
> > >> configuration via the DT compatible string.
> > >>
> > >> The Vision Components imx258 module supports PDAF, so add the
> > >> register differences for that variant
> > >>
> > >> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >> Signed-off-by: Luis Garcia <git@luigi311.com>
> > >> ---
> > >>  drivers/media/i2c/imx258.c | 48 ++++++++++++++++++++++++++++++++++----
> > >>  1 file changed, 44 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > >> index 775d957c9b87..fa48da212037 100644
> > >> --- a/drivers/media/i2c/imx258.c
> > >> +++ b/drivers/media/i2c/imx258.c
> > >> @@ -6,6 +6,7 @@
> > >>  #include <linux/delay.h>
> > >>  #include <linux/i2c.h>
> > >>  #include <linux/module.h>
> > >> +#include <linux/of_device.h>
> > >>  #include <linux/pm_runtime.h>
> > >>  #include <linux/regulator/consumer.h>
> > >>  #include <media/v4l2-ctrls.h>
> > >> @@ -321,8 +322,6 @@ static const struct imx258_reg mipi_642mbps_24mhz_4l[] = {
> > >>
> > >>  static const struct imx258_reg mode_common_regs[] = {
> > >>    { 0x3051, 0x00 },
> > >> -  { 0x3052, 0x00 },
> > >> -  { 0x4E21, 0x14 },
> > >>    { 0x6B11, 0xCF },
> > >>    { 0x7FF0, 0x08 },
> > >>    { 0x7FF1, 0x0F },
> > >> @@ -345,7 +344,6 @@ static const struct imx258_reg mode_common_regs[] = {
> > >>    { 0x7FA8, 0x03 },
> > >>    { 0x7FA9, 0xFE },
> > >>    { 0x7B24, 0x81 },
> > >> -  { 0x7B25, 0x00 },
> > >>    { 0x6564, 0x07 },
> > >>    { 0x6B0D, 0x41 },
> > >>    { 0x653D, 0x04 },
> > >> @@ -460,6 +458,33 @@ static const struct imx258_reg mode_1048_780_regs[] = {
> > >>    { 0x034F, 0x0C },
> > >>  };
> > >>
> > >> +struct imx258_variant_cfg {
> > >> +  const struct imx258_reg *regs;
> > >> +  unsigned int num_regs;
> > >> +};
> > >> +
> > >> +static const struct imx258_reg imx258_cfg_regs[] = {
> > >> +  { 0x3052, 0x00 },
> > >> +  { 0x4E21, 0x14 },
> > >> +  { 0x7B25, 0x00 },
> > >> +};
> > >> +
> > >> +static const struct imx258_variant_cfg imx258_cfg = {
> > >> +  .regs = imx258_cfg_regs,
> > >> +  .num_regs = ARRAY_SIZE(imx258_cfg_regs),
> > >> +};
> > >> +
> > >> +static const struct imx258_reg imx258_pdaf_cfg_regs[] = {
> > >> +  { 0x3052, 0x01 },
> > >> +  { 0x4E21, 0x10 },
> > >> +  { 0x7B25, 0x01 },
> > >> +};
> > >> +
> > >> +static const struct imx258_variant_cfg imx258_pdaf_cfg = {
> > >> +  .regs = imx258_pdaf_cfg_regs,
> > >> +  .num_regs = ARRAY_SIZE(imx258_pdaf_cfg_regs),
> > >> +};
> > >> +
> > >>  static const char * const imx258_test_pattern_menu[] = {
> > >>    "Disabled",
> > >>    "Solid Colour",
> > >> @@ -637,6 +662,8 @@ struct imx258 {
> > >>    struct v4l2_subdev sd;
> > >>    struct media_pad pad;
> > >>
> > >> +  const struct imx258_variant_cfg *variant_cfg;
> > >> +
> > >>    struct v4l2_ctrl_handler ctrl_handler;
> > >>    /* V4L2 Controls */
> > >>    struct v4l2_ctrl *link_freq;
> > >> @@ -1104,6 +1131,14 @@ static int imx258_start_streaming(struct imx258 *imx258)
> > >>            return ret;
> > >>    }
> > >>
> > >> +  ret = imx258_write_regs(imx258, imx258->variant_cfg->regs,
> > >> +                          imx258->variant_cfg->num_regs);
> > >> +  if (ret) {
> > >> +          dev_err(&client->dev, "%s failed to set variant config\n",
> > >> +                  __func__);
> > >> +          return ret;
> > >> +  }
> > >> +
> > >>    ret = imx258_write_reg(imx258, IMX258_CLK_BLANK_STOP,
> > >>                           IMX258_REG_VALUE_08BIT,
> > >>                           imx258->csi2_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK ?
> > >> @@ -1492,6 +1527,10 @@ static int imx258_probe(struct i2c_client *client)
> > >>
> > >>    imx258->csi2_flags = ep.bus.mipi_csi2.flags;
> > >>
> > >> +  imx258->variant_cfg = of_device_get_match_data(&client->dev);
> > >
> > > You'll also need to keep this working for ACPI based systems. I.e. in
> > > practice remove "of_" prefix here and add the non-PDAF variant data to the
> > > relevant ACPI ID list.
> > >
> >
> > Removing of_ is easy enough and looking at all the other commits that make
> > this change in other drivers I dont see anything else being done besides
> > adding in the .data section that is down below for both imx258 and pdaf
> > versions. Is that what you are referencing or is there some other place
> > to add variant data to ACPI ID list?
>
> Speaking of which---are you absolutely certain there are two variants of
> this sensor? Many sensors that have a different pixel pattern (PDAF pixels
> or a non-Bayer pattern) can produce Bayer data when condigured so. The fact
> that you have differing register configuration for the PDAF and non-PDAF
> cases suggests this may well be the case.

I had a discussion with our contact at Sony over the configuration,
and Soho Enterprises who made the module I have also consulted with
Sony (their main person is ex Sony himself).

There is a spec version field in the OTP which reflects the pixel
pattern. It has defined options of:
- HDR pattern
- Binning pattern
- mono
- non-PDAF
- HDR HDD

Sony can't release information on how to read that information from
the sensor OTP as it is contractually locked by contracts with Intel.
Whilst information obtained via other routes means I have checked it
on my module as HDR pattern whilst the Nautilus platform has the
non-PDAF variant, I'm not going to spoil our relationship with Sony by
releasing that.

It's possible that the Nautilus sensor will work happily with the
settings required for the PDAF variant, but I have no way of testing
that, and the registers in question are undocumented. Changing them
blindly isn't going to make any friends, and I doubt existing platform
users wish to rerun all their image quality tests on the sensor to
validate the change.

Unless Intel wish to release the information on reading the OTP, we
have no way of telling the variants apart but need different register
configurations. If there is a better way of handling that situation
than compatible strings, then I'm open to suggestions.

There's a short thread on libcamera-devel from back in 2022 where I
was looking into this [1]

  Dave

[1] https://lists.libcamera.org/pipermail/libcamera-devel/2022-June/031449.html

> >
> > >> +  if (!imx258->variant_cfg)
> > >> +          imx258->variant_cfg = &imx258_cfg;
> > >> +
> > >>    /* Initialize subdev */
> > >>    v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
> > >>
> > >> @@ -1579,7 +1618,8 @@ MODULE_DEVICE_TABLE(acpi, imx258_acpi_ids);
> > >>  #endif
> > >>
> > >>  static const struct of_device_id imx258_dt_ids[] = {
> > >> -  { .compatible = "sony,imx258" },
> > >> +  { .compatible = "sony,imx258", .data = &imx258_cfg },
> > >> +  { .compatible = "sony,imx258-pdaf", .data = &imx258_pdaf_cfg },
> > >>    { /* sentinel */ }
> > >>  };
> > >>  MODULE_DEVICE_TABLE(of, imx258_dt_ids);
> > >
> >
>
> --
> Regards,
>
> Sakari Ailus
