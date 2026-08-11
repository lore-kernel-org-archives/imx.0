Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B2338BF72;
	Tue, 11 Aug 2026 22:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786487787; cv=none; b=bydltjQZjtQCzslXAZS92MwzlWxDtt/8WEdyjWxJqRr1rl4g+pEUAWEiXYYJmPRon7TZpDPlyDF8XMOtZGFHCYMuBBK3uVGJW932OpLg7vLo1CXZfSFPa8LeP0Ea1zNLpTAlQb4ErE6omHL705D7uC0brAxMQnE4EfD1c/Nj228=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786487787; c=relaxed/simple;
	bh=hLXlO8OGbf3XJSbiWuF+iEt1Mq+7LeGJsBLgoIAggdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBMEFOK3CPjYDDz+iO7aTCuWN8cNNplT8tdCk4PbYKfvvmVUWZTvX9tWny1BzptnK5kkT1BJtmTkt3nkpL/a5F5r+/pz5lBzPCz4gWf4bn9FH3Mxy4kR5JUrG19KvlyB051rlwlOktdpwReMgzpZzTwdpZRi0wMYxxFOvueIfjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyQYYuvm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyQYYuvm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0B11F000E9;
	Tue, 11 Aug 2026 22:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786487786;
	bh=SOjRDT0QyUmvcbxdw+hgxoVn/f53/4hB1akmWL7rRCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NyQYYuvmiglFEplEmbzildxSn+OSKqkPuV0e5r1r62O8++csG0c5Bxcov9p5QSOsU
	 WYbv8w0keVxp02RgfiNSsazE6AYbQj0wHXNX3bh1svOOJqxxymx27EuPaFHQTM90k5
	 vD4VyHR/J3ZV63GTFeJBM87dY4+a79XFX5jI1bmh3McSFTxDOw9sEgp8qAoKxU4Ct8
	 cQUsCxb6yA6d073R907SiyNWhS/avujM7EGJ6h0Tlc7OXKxI6Xh+uJOjocI2cRzdTe
	 yp37UY2pntrSqcPsmF9g0AqWy4VoUlajjpTEl9wqDBEAqapkeOfsc4SHGeY7zT/Sts
	 PKiWw6H+6f7rg==
Date: Tue, 11 Aug 2026 15:36:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Message-ID: <20260811223622.GA934543@ax162>
References: <20260811151905.311267-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811151905.311267-1-daniel.baluta@nxp.com>

On Tue, Aug 11, 2026 at 06:19:05PM +0300, Daniel Baluta wrote:
> DRM_MSM unconditionally selects QCOM_UBWC_CONFIG, which calls SMEM APIs,
> causing a link error on non-Qcom platforms (e.g. SOC_IMX5):
> 
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>       reference to 'qcom_smem_is_available'
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x4c): undefined
>       reference to 'qcom_smem_dram_get_hbb'
> 
> Relax the selection of QCOM_UBWC_CONFIG to ARCH_QCOM only and make QCOM_UBWC_CONFIG
> depend on QCOM_SMEM make the requirement explicit.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
> Changes since v1:
> - (addressed feedback from Dmitry) replace adding static inline stubs with preparing a better config
>   dependecies so that we use the qcom_smem symbols only on QCOM platforms.
> - Link to v1: https://lore.kernel.org/imx/sy2ulk536ryakhy6fdnqr4asvzvufqk3dlo2awdrfomulyf4n4@qtp4qoazqmhj/T/#t
> 
>  drivers/gpu/drm/msm/Kconfig | 2 +-
>  drivers/soc/qcom/Kconfig    | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 09469d56513b0..ab3844521255e 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -22,7 +22,7 @@ config DRM_MSM
>  	select TMPFS
>  	select QCOM_SCM
>  	select QCOM_PAS
> -	select QCOM_UBWC_CONFIG
> +	select QCOM_UBWC_CONFIG if ARCH_QCOM
>  	select WANT_DEV_COREDUMP
>  	select SND_SOC_HDMI_CODEC if SND_SOC
>  	select SYNC_FILE
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index fd4d4ecd2df0f..e0629e9328c87 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -321,6 +321,7 @@ config QCOM_QMI_HELPERS
>  
>  config QCOM_UBWC_CONFIG
>  	tristate
> +	depends on QCOM_SMEM
>  	help
>  	  Most Qualcomm SoCs feature a number of Universal Bandwidth Compression
>  	  (UBWC) engines across various IP blocks, which need to be initialized
> -- 
> 2.45.2
> 

This does not fully fix the issue. ARCH_QCOM=y and QCOM_SMEM=n will
still trigger the issue because select does not respect dependencies:

  $ echo CONFIG_QCOM_SMEM=n >kernel/configs/no_smem.config

  $ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- mrproper defconfig no_smem.config all
  WARNING: unmet direct dependencies detected for QCOM_UBWC_CONFIG
    Depends on [n]: QCOM_SMEM [=n]
    Selected by [m]:
    - DRM_MSM [=m] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM [=y] || SOC_IMX5 [=y] || COMPILE_TEST [=n]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && OF [=y] && (QCOM_AOSS_QMP [=y] || QCOM_AOSS_QMP [=y]=n [=n]) && (QCOM_OCMEM [=m] || QCOM_OCMEM [=m]=n [=n]) && (QCOM_LLCC [=m] || QCOM_LLCC [=m]=n [=n]) && (QCOM_COMMAND_DB [=m] || QCOM_COMMAND_DB [=m]=n [=n]) && PM [=y] && ARCH_QCOM [=y]
  ERROR: modpost: drivers/soc/qcom/ubwc_config.ko: symbol 'qcom_smem_is_available' undefined!
  ERROR: modpost: drivers/soc/qcom/ubwc_config.ko: symbol 'qcom_smem_dram_get_hbb' undefined!
  ...

-- 
Cheers,
Nathan
