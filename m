Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACC71C84BC
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 22:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785363350; cv=none; b=IZbQjsxsII48XMcUOwUzsXbVrhyRvhJXNSKk/b+wY6tbP7SxjbEMeGDRB6YMijU0XgBe0G5af1bq8JxdBOadGL/V5UcGzL6l4WVO3UWCcnoYMR69/QEfzXxxxsN/I5VbbQ1SyEFiN7KO9ppz7lB+5p8RmzRrnZXxpGP1YOh0m80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785363350; c=relaxed/simple;
	bh=VjHddQDIccFSwblzXHbsrmu1s/HADKDCrimEbpCX99M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxGq/XuSLUiPzSMa7RCVDIS94JG0JAmfcncy5KXI/2cjYBl1okw2gZ7yvnKDAWEeSXB29HmCV9i8Ml6N7Kz8WXe8aJmfC7kzRlmq0uUHNFAH8q3kb+QnQE3y00Xzg+TOO4JYIWZw3GCwQwzKicBcsPWf6z+JD3wenbl8OCz7hT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBCvQLOE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBCvQLOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785363348; x=1816899348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VjHddQDIccFSwblzXHbsrmu1s/HADKDCrimEbpCX99M=;
  b=cBCvQLOEXi2fwUPyd+OhLF/jSrCIrowXvj7EdG7SxLEnB3FiPtav1CaH
   OxTS8VtOwaHLLr/16JBoF3eInaAqIuIWBN8oUJeIN2GpRd5AmNUgkYyXp
   X3V7BedMTItgydYO1Eiul3CTi701qpNxyz5kPp3PiFtsUHE/Y1ZO+n+Ok
   1BOIfhdfHNIDeUXcALa4ZvK2yRGvmOjqiQIF7ENflAg6qOGNeEfTJpY8I
   Z6EDg5ViwQ74b7ctZkPR3MHyqMD+mt63sbHk40heehIByf6/nYIG3ICoI
   CkN1DUpXz6KcCZbkMlWFyw6feBC7QaIOzB4HtVm4YNWUKgsyoGAcema7y
   Q==;
X-CSE-ConnectionGUID: q2oRVnFGQ5yMK7Qc3uC05Q==
X-CSE-MsgGUID: I6okgLGSSYSwLZnhUlmJXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97135550"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="97135550"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 15:15:48 -0700
X-CSE-ConnectionGUID: mSYcTqNbRCaK/gC1H9Dv4g==
X-CSE-MsgGUID: TXknkLWsQk6blPlHfGb0wA==
X-ExtLoop1: 1
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.90])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 15:15:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ED97511F8BD;
	Thu, 30 Jul 2026 01:15:43 +0300 (EEST)
Date: Thu, 30 Jul 2026 01:15:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 2/5] media: hi846: Fix link frequency handling
Message-ID: <amp7jz-GXMqIRTeo@kekkonen.localdomain>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
 <20260712115012.91600-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712115012.91600-3-mitltlatltl@gmail.com>

Hi Pengyu,

On Sun, Jul 12, 2026 at 07:50:09PM +0800, Pengyu Luo wrote:
> Link frequency is tied to PLL configuration, lane count, and external
> clock rate, so use runtime here instead of hardcoding for specific
> configuration. To implement this, we do
> 
> 1. Drop exposed link_freq as a v4l2_ctrl, it is inconvenient to expose
> it as an int_menu when freq_links are varies between mclk rates, this
> will not break v4l2_get_link_freq() since it can be calculated back
> from pixel rate which is previously from the dynamic link frequency.

The pixel rate can't substitute link frequency -- these are different
things. Please keep the LINK_FREQ control. Its values should nonetheless
reflect the actual frequency used.

> 
> 2. Attach mipi_clk_div_{2,4}lane to current mode, and use the div with
> mclk clock, lane count to calculate link frequency.
> 
> 3. Drop mclk clock rate check.
> 
> Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
> v5:
> - Use separated fields instead of raw register values for PLL cfg (Sakari)
> - Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
> - Drop line break (Sakari)
> ---
> Hi, Sakari. I did not follow to use v4l2_link_freq_to_bitmap(), which
> you mentioned in v4, since we have no fixed int_menu for link_freq.
> ---
>  drivers/media/i2c/hi846.c | 82 ++++++++++++++++++---------------------
>  1 file changed, 37 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 7f069aca0fce..6bcd862aee30 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2021 Purism SPC
>  
> -#include <linux/unaligned.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> @@ -11,6 +11,7 @@
>  #include <linux/pm.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/unaligned.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -219,8 +220,8 @@ struct hi846_mode {
>  	/* Horizontal timing size */
>  	u32 llp;
>  
> -	/* Link frequency needed for this resolution */
> -	u8 link_freq_index;
> +	u8 mipi_clk_div_2lane;
> +	u8 mipi_clk_div_4lane;
>  
>  	u16 fps;
>  
> @@ -1040,13 +1041,6 @@ static const char * const hi846_test_pattern_menu[] = {
>  	"Resolution Pattern",
>  };
>  
> -#define FREQ_INDEX_640	0
> -#define FREQ_INDEX_1280	1
> -static const s64 hi846_link_freqs[] = {
> -	[FREQ_INDEX_640] = 80000000,
> -	[FREQ_INDEX_1280] = 200000000,
> -};
> -
>  static const struct hi846_reg_list hi846_init_regs_list_2lane = {
>  	.num_of_regs = ARRAY_SIZE(hi846_init_2lane),
>  	.regs = hi846_init_2lane,
> @@ -1061,7 +1055,13 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 640,
>  		.height = 480,
> -		.link_freq_index = FREQ_INDEX_640,
> +		.mipi_clk_div_2lane = 4,
> +		/*
> +		 * Dummy but necessary if we set this mode default, otherwise
> +		 * hi846_calc_pixel_rate() will be broken in
> +		 * hi846_init_controls()
> +		 */
> +		.mipi_clk_div_4lane = 8,
>  		.fps = 120,
>  		.frame_len = 631,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1086,7 +1086,8 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 1280,
>  		.height = 720,
> -		.link_freq_index = FREQ_INDEX_1280,
> +		.mipi_clk_div_2lane = 2,
> +		.mipi_clk_div_4lane = 4,
>  		.fps = 90,
>  		.frame_len = 842,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1112,7 +1113,8 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 1632,
>  		.height = 1224,
> -		.link_freq_index = FREQ_INDEX_1280,
> +		.mipi_clk_div_2lane = 2,
> +		.mipi_clk_div_4lane = 4,
>  		.fps = 30,
>  		.frame_len = 2526,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1161,7 +1163,6 @@ struct hi846 {
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	u8 nr_lanes;
>  
> -	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *hblank;
> @@ -1192,21 +1193,28 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
>  	return NULL;
>  }
>  
> -static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
> +static u64
> +hi846_get_link_freq(struct hi846 *hi846, const struct hi846_mode *mode)
>  {
> -	return hi846->cur_mode->link_freq_index;
> -}
> +	u64 mclk = clk_get_rate(hi846->clock);
> +	u8 mipi_clk_div;
>  
> -static u64 hi846_get_link_freq(struct hi846 *hi846)
> -{
> -	u8 index = hi846_get_link_freq_index(hi846);
> +	if (hi846->nr_lanes == 2)
> +		mipi_clk_div = mode->mipi_clk_div_2lane;
> +	else
> +		mipi_clk_div = mode->mipi_clk_div_4lane;
>  
> -	return hi846_link_freqs[index];
> +	/*
> +	 * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
> +	 * [11:8]: 0x02 => pre_div = 3
> +	 * [7:0]: 0x5a => multiplier = 90
> +	 */
> +	return mul_u64_u32_div(mclk, 90, 3 * mipi_clk_div);
>  }
>  
>  static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
>  {
> -	u64 link_freq = hi846_get_link_freq(hi846);
> +	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
>  	u64 pixel_rate = link_freq * 2 * hi846->nr_lanes;
>  
>  	do_div(pixel_rate, HI846_RGB_DEPTH);
> @@ -1426,14 +1434,6 @@ static int hi846_init_controls(struct hi846 *hi846)
>  
>  	ctrl_hdlr->lock = &hi846->mutex;
>  
> -	hi846->link_freq =
> -		v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
> -				       V4L2_CID_LINK_FREQ,
> -				       ARRAY_SIZE(hi846_link_freqs) - 1,
> -				       0, hi846_link_freqs);
> -	if (hi846->link_freq)
> -		hi846->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
>  	hi846->pixel_rate =
>  		v4l2_ctrl_new_std(ctrl_hdlr, &hi846_ctrl_ops,
>  				  V4L2_CID_PIXEL_RATE, 0,
> @@ -1503,10 +1503,9 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
>  	u64 frame_length;
>  	int ret = 0;
>  	int dummy_lines;
> -	u64 link_freq = hi846_get_link_freq(hi846);
> +	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
>  
> -	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
> -		hi846_get_link_freq(hi846));
> +	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__, link_freq);
>  
>  	do_div(link_freq, fps);
>  	frame_length = link_freq;
> @@ -1749,7 +1748,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
>  	mf->code = HI846_MEDIA_BUS_FORMAT;
>  	mf->field = V4L2_FIELD_NONE;
>  
> -	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
>  	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
>  				 hi846_calc_pixel_rate(hi846));
>  
> @@ -1950,16 +1948,17 @@ static int hi846_identify_module(struct hi846 *hi846)
>  static s64 hi846_check_link_freqs(struct hi846 *hi846,
>  				  struct v4l2_fwnode_endpoint *ep)
>  {
> -	const s64 *freqs = hi846_link_freqs;
> -	int freqs_count = ARRAY_SIZE(hi846_link_freqs);
> +	int freqs_count = ARRAY_SIZE(supported_modes);
> +	u64 link_freq;
>  	int i, j;
>  
>  	for (i = 0; i < freqs_count; i++) {
> +		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
>  		for (j = 0; j < ep->nr_of_link_frequencies; j++)
> -			if (freqs[i] == ep->link_frequencies[j])
> +			if (link_freq == ep->link_frequencies[j])
>  				break;
>  		if (j == ep->nr_of_link_frequencies)
> -			return freqs[i];
> +			return link_freq;
>  	}
>  
>  	return 0;
> @@ -2041,7 +2040,6 @@ static int hi846_probe(struct i2c_client *client)
>  	struct hi846 *hi846;
>  	int ret;
>  	int i;
> -	u32 mclk_freq;
>  
>  	hi846 = devm_kzalloc(&client->dev, sizeof(*hi846), GFP_KERNEL);
>  	if (!hi846)
> @@ -2060,12 +2058,6 @@ static int hi846_probe(struct i2c_client *client)
>  				     "failed to get clock: %pe\n",
>  				     hi846->clock);
>  
> -	mclk_freq = clk_get_rate(hi846->clock);
> -	if (mclk_freq != 25000000)
> -		dev_warn(&client->dev,
> -			 "External clock freq should be 25000000, not %u.\n",
> -			 mclk_freq);
> -
>  	for (i = 0; i < HI846_NUM_SUPPLIES; i++)
>  		hi846->supplies[i].supply = hi846_supply_names[i];
>  

-- 
Kind regards,

Sakari Ailus
