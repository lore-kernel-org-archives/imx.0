Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5CC335BBB;
	Thu, 13 Aug 2026 23:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786663436; cv=none; b=ac0cFU+tKthL89FdccdTCLE7g7avXBrCjdxwgAxjVI/fMUmWFbQC9p7IctA4RQoxmSfZii/RbmWCo8OTzRMevE/1YyD+pB9h5IUnEvK3ogqSDEJohfLcRJd4LtVketFP1dRRPAFj8sx1B1hD6NoIJ16Klp5jvqEODfG2yDtbd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786663436; c=relaxed/simple;
	bh=jzd3vJorHAMYnzgjLXtaZpBTz9hN405v+ulOJSL1aHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WM+n+143tNzi5c2JH+xTv/uVpL7cUENYH+UaESTiHTDmvXY+KcyEmAYezv90mHSni3CjSp2xIdk0Htq5+X+F5PGQC4/RXz0CCyPZgSXNN3tc6TaMaf3SUXtVekXF9Pgmds7XBn9QrifDXd4sEmhqwoC72SMA2MAwi9OSfNVRDC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lll6Ys3k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lll6Ys3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAAB61F000E9;
	Thu, 13 Aug 2026 23:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786663435;
	bh=T7aQ0tkgbbXIItRPL5YNPsO8S8svUtxhRjOtvySAEk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lll6Ys3kcYlyNQAsFHOONDAyjfeEIg50EJMe09q8RelqnG4HaX2H+lGBxw7buGeu6
	 clHyz4GRBPCPqgQu+6Mr1aFoRqrNf8hdulXieukx3Z2rpYtD6z6e/Ftg9zmnd5gnlI
	 9/IP9zy23yN/dpjEm3PON++MWfYhB8TtBK/rUVtJNVtq0QYugEePTQ7rDWNQD1tt1J
	 5VvW3V3iXkjpNAjdNqzhBT5DIBJEKenkrvC78kQV/tcqrQ15y1ABjqV4A1VgCfzUlB
	 k4eUCq+GbQJ4XgO51jPQdtJ+0AjpLQaYsLQ96eKDycPZmXmb5PQAoD/dySCTbwsmly
	 B1+CqXZdtzFTw==
Date: Thu, 13 Aug 2026 16:23:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 0/3] soc: qcom: ubwc: Fix link error
Message-ID: <20260813232350.GA312295@ax162>
References: <20260812151934.709198-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812151934.709198-1-daniel.baluta@nxp.com>

Hi Daniel,

On Wed, Aug 12, 2026 at 06:19:31PM +0300, Daniel Baluta wrote:
> Fix link error caused by the fact that drivers/soc/qcom/ubwc_config.c
> enabled via QCOM_UBWC_CONFIG uses unconditionally symbols from
> drivers/soc/qcom/smem.c enabled via CONFIG_QCOM_SMEM.
> 
> Changes since v3:
> - fix issues pointed by sashiko https://sashiko.dev/#/patchset/20260812130421.670527-1-daniel.baluta%40nxp.com
>  - add new patches 2/3 in order to fix unmet dependcy for VIDEO_QCOM_IRIS
>  - Use IS_REACHABLE instead of IS_ENABLED to avoid the situation we use
>    some symbols in builtin kernel but their definitions sits in a
> module.
> 
> Remark for Dmitry, at this point I think v1 would have been a better
> option.
> Link to v1:
> -	https://lore.kernel.org/imx/1521da8e-18df-4d7b-a255-5ca133bd5ccc@oss.nxp.com/T/#t
> 
> 
> 
> Daniel Baluta (3):
>   soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
>   media: iris: Fix unmet dependency when QCOM_SMEM=n

I think this patch should come first since you introduce the QCOM_SMEM
dependency that requires this change in the first patch, which could
mess with bisects. I would personally add the 'if' condition to the
'select QCOM_UBWC_CONFIG' statements in one patch then add the QCOM_SMEM
dependency to QCOM_UBWC_CONFIG in a separate patch.

>   soc: qcom: ubwc: Use IS_REACHABLE() instead of IS_ENABLED()

Even with this series applied, I see

  $ cat allno.config
  CONFIG_ARCH_MULTI_V7=y
  CONFIG_ARCH_QCOM=y
  CONFIG_DRM=y
  CONFIG_DRM_MSM=y
  CONFIG_DRM_MSM_DPU=y
  CONFIG_IOMMU_SUPPORT=y
  CONFIG_MAILBOX=y
  CONFIG_MMU=y
  CONFIG_PM=y
  CONFIG_QCOM_AOSS_QMP=y
  CONFIG_QCOM_LLCC=y
  CONFIG_QCOM_OCMEM=y

  $ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- KCONFIG_ALLCONFIG=1 allnoconfig drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.o
  In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:7:
  include/linux/soc/qcom/ubwc.h: In function 'qcom_ubwc_config_get_data':
  include/linux/soc/qcom/ubwc.h:45:16: error: implicit declaration of function 'ERR_PTR' [-Wimplicit-function-declaration]
     45 |         return ERR_PTR(-EOPNOTSUPP);
        |                ^~~~~~~
  include/linux/soc/qcom/ubwc.h:45:25: error: 'EOPNOTSUPP' undeclared (first use in this function)
     45 |         return ERR_PTR(-EOPNOTSUPP);
        |                         ^~~~~~~~~~
  include/linux/soc/qcom/ubwc.h:45:25: note: each undeclared identifier is reported only once for each function it appears in
  In file included from include/linux/cleanup.h:6,
                   from include/linux/irqflags.h:17,
                   from arch/arm/include/asm/bitops.h:28,
                   from include/linux/bitops.h:67,
                   from include/linux/kernel.h:23,
                   from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h:10,
                   from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h:8,
                   from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:9:
  include/linux/err.h: At top level:
  include/linux/err.h:39:44: error: conflicting types for 'ERR_PTR'; have 'void *(long int)'
     39 | static __always_inline void * __must_check ERR_PTR(long error)
        |                                            ^~~~~~~
  include/linux/soc/qcom/ubwc.h:45:16: note: previous implicit declaration of 'ERR_PTR' with type 'int()'
     45 |         return ERR_PTR(-EOPNOTSUPP);
        |                ^~~~~~~

Adding '#include <linux/err.h>' to include/linux/soc/qcom/ubwc.h appears
to resolve that for me.

-- 
Cheers,
Nathan
