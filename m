Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C343129E94
	for <imx@lists.linux.dev>; Fri, 24 May 2024 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716541505; cv=none; b=fzLPyae3g+abh2YxAuiROBkIi3cuexk/ksd9YO3SbP+yweugQnJEIsN7jyqOyIvlKdmGWK9SRfCzDGHHnQU4g1Lcp+PRiKsXYyK6heZCH44FC+1PzZNupGE7TirpnRvw4mCohpidM+ZP8rQHV9sjfzifkd7/ezjk1u3oS0UWdDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716541505; c=relaxed/simple;
	bh=QknNTek5hZ/unaPk2F7O7L5h7E+LUgaHwteegjzsQD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uNqfCatHExPFSgpSp8wdC6AvRuEUppoUsB78OoqPHXpyjBxihkQLNNwyf4UMcYlDNn2HhA9Vls9z9ve4YEaCLYdltlYZEUy84lX7ssjDDHWqB7BG6W39rEzeRCespF1YIRLL8SndWzJaZtfp9Ssdbyyr08nzmG3NQU2F67QRPww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zti2qep/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zti2qep/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716541503; x=1748077503;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=QknNTek5hZ/unaPk2F7O7L5h7E+LUgaHwteegjzsQD8=;
  b=Zti2qep/C4mfCrnSOdxscbetxeRhdHzbRHhvRb7U3rZUN0ECRkzzr+r9
   Fg/RtAOQ6zsRFTyJoIEnshqxc/32g6f9TMoWaS3uLYYJdBJ9AGUjQuzaw
   1IXow1zK17kEd3jO9daK5fUEgWXMk8ASsjunEpBTWeDcprOxtYutaedgk
   /4gZJfxvtHt20+9+gvjiyGQ2nuo6J/SUMLyipe+x3d9+OxGoFe5knYxk8
   lUyegQvciWlVz9U8/a9fFupttUPuo88il3Jfw/cNtd5GGsN/rwt/weCA5
   T5080apmwgNd37/aQntPlTkLwdtbDhhcXzRXDH/rA6Sgre1SNbspumsgw
   A==;
X-CSE-ConnectionGUID: nHnLUKhLT+mDEVZ5CBgp7Q==
X-CSE-MsgGUID: NT2kkJeuQ/OkRd3Fcrw0xA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16736925"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="16736925"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 02:05:03 -0700
X-CSE-ConnectionGUID: owI/ScNCSAe5LggpAUHqFQ==
X-CSE-MsgGUID: tjoMYhfrTG2Ja7PoLqmA8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="34067922"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.108])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 02:04:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Philipp
 Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/4] drm/imx: fix -Wformat-truncation warning in
 imx_ldb_probe()
In-Reply-To: <Zk99m4i82XnQPeKQ@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1716479340.git.jani.nikula@intel.com>
 <c257c4174743f35bafee8492ec60e1d2734450cf.1716479340.git.jani.nikula@intel.com>
 <Zk99m4i82XnQPeKQ@intel.com>
Date: Fri, 24 May 2024 12:04:56 +0300
Message-ID: <87jzjjoa13.fsf@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 23 May 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, May 23, 2024 at 06:51:08PM +0300, Jani Nikula wrote:
>> Enabling -Wformat-truncation yields the following warning:
>>=20
>> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function =E2=80=98imx_ldb_pro=
be=E2=80=99:
>> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: error: =E2=80=98_sel=E2=
=80=99 directive output may be truncated writing 4 bytes into a region of s=
ize between 3 and 13 [-Werror=3Dformat-truncation=3D]
>>   658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i=
);
>>       |                                                         ^~~~
>> ../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:17: note: =E2=80=98snprintf=
=E2=80=99 output between 8 and 18 bytes into a destination of size 16
>>   658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i=
);
>>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> If only the compiler could count to three...

I did not try, but apparently using %hhd would hide the issue too:

	snprintf(clkname, sizeof(clkname), "di%hhd_sel", i);

BR,
Jani.


>
>>=20
>> Silence the warning by checking the snprintf() return value.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>> ---
>>=20
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> ---
>>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/i=
puv3/imx-ldb.c
>> index 71d70194fcbd..46f779fe60ee 100644
>> --- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
>> +++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
>> @@ -654,8 +654,12 @@ static int imx_ldb_probe(struct platform_device *pd=
ev)
>>  	 */
>>  	for (i =3D 0; i < 4; i++) {
>>  		char clkname[16];
>> +		int len;
>> +
>> +		len =3D snprintf(clkname, sizeof(clkname), "di%d_sel", i);
>> +		if (len >=3D sizeof(clkname))
>> +			dev_err(dev, "clkname truncated\n");
>>=20=20
>> -		snprintf(clkname, sizeof(clkname), "di%d_sel", i);
>>  		imx_ldb->clk_sel[i] =3D devm_clk_get(imx_ldb->dev, clkname);
>>  		if (IS_ERR(imx_ldb->clk_sel[i])) {
>>  			ret =3D PTR_ERR(imx_ldb->clk_sel[i]);
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel
