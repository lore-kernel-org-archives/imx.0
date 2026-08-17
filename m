Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0407046D090;
	Mon, 17 Aug 2026 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786990669; cv=none; b=DIzowxv7hjkQ7cIJwNLTVLb8JnZ+idtCz011UT5SPxF8JLi7kI33fLuEiC1ymXDnAYgIqcwB0TT7oUtLUmuRVuF9ndKSAGkYTzddmVOJxaV+KRvSqe0ANn9gZyhS8M9b+AJq1x024HjOq4MKWDyarow4k9QT3BQxMvSLYDUpIRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786990669; c=relaxed/simple;
	bh=A1xtJH1dtWtlOo8MWmaGcx+damaEBv4AQvpLA/8qKN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lv0OpXJ8CVI9pO54/rNu7mZ4/9QFXiFQFtNwzz1JDW5UkyfBIn55AiyRgDzfx9/MBpcit5y01JW5arAKJ3ToXRpv8t1l7BJbSxBp+WDA6yOtbLumyehKFkmFSTHokCPBFYQQhJbxMRNGfZ/Si+PoJUS7/lTl5ufTnNgTpGlytiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4UDVAgM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4UDVAgM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2DC1F00A3A;
	Mon, 17 Aug 2026 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786990666;
	bh=pSKZIEbu1AMiK6gHIury9PzNZ5QzXZnHelzTkuXnt1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F4UDVAgMF3qksba1mfUPOZkMBCr+sfiFCaSbyXXys3LUVies34Px1OR0G8t/y+X69
	 XHPfEFM414BZ2Q5sbGtXVrb35i8HABjSPdRb03BPPV1KCdc/Ed3A7+kmwx6gY+bbkW
	 V9wuduvI19/3gx2qyMcAUUvVaYPdpA00/7kOLQNgvXCZOpaNh+F8S/c6mRMsFaf5E6
	 J0MBP5eRJRJpwRgefe7fPQv5jXzFXFjQPDj8ClCilrAo0IUQkdz81zge7VYYl2mvy0
	 0/a2CbdwjIXYHa6A0rTozbXzIzMgJDI+h2Ks76MnbPOXGULdtWCxPnEVXwDkr2g7Jh
	 4EA1FCiL4XqhA==
Date: Mon, 17 Aug 2026 11:17:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v6 0/4] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Message-ID: <20260817181743.GB1249844@ax162>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817123542.48475-1-daniel.baluta@nxp.com>

Hi Daniel,

On Mon, Aug 17, 2026 at 03:35:37PM +0300, Daniel Baluta wrote:
> DRM_MSM and VIDEO_QCOM_IRIS select QCOM_UBWC_CONFIG, whose
> ubwc_config.c calls QCOM_SMEM APIs unconditionally. On configs without
> QCOM_SMEM this fails to link, e.g. on SOC_IMX5:
> 
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>       reference to 'qcom_smem_is_available'
> 
> Fix it by making the QCOM_SMEM requirement explicit in Kconfig.
> 
> Changes since v5:
>  * added patch 4/4 to this series, which was initially sent as a
>  standalone patch (addresses review from Nathan)
>  * no other change to the series.
>  * picked up all R-b and Acked-by tags.
> 
> Link to v5: https://lore.kernel.org/imx/20260814141724.1006382-1-daniel.baluta@nxp.com/T/#t
> 
> Daniel Baluta (4):
>   drm/msm: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
>   media: iris: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
>   soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
>   soc: qcom: ubwc: Fix missing include
> 
>  drivers/gpu/drm/msm/Kconfig              | 3 ++-
>  drivers/media/platform/qcom/iris/Kconfig | 3 ++-
>  drivers/soc/qcom/Kconfig                 | 1 +
>  include/linux/soc/qcom/ubwc.h            | 1 +
>  4 files changed, 6 insertions(+), 2 deletions(-)

Thanks, this resolves the build errors that I noticed.

Tested-by: Nathan Chancellor <nathan@kernel.org> # build

-- 
Cheers,
Nathan
