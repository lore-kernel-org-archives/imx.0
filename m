Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445F843E9C6
	for <imx@lists.linux.dev>; Mon, 11 May 2026 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519415; cv=none; b=oaywjaq9PE2f9xCJtOhf6mwVTqIS8386SPBqbXcHAI9Z7ZtZ5I4luHew+uT0gEUrtxYQShIrsZ6hpK7SKgWlBXkN0+NbGEBkPp5gFWR5vZwxQXifRLXj4A3RrIPXnhZUtbFjS26pKrQBuTGYjNAEF4d8+Szu5VUjfSYBeB9RlDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519415; c=relaxed/simple;
	bh=D/KRR3cWA8YhRg3pD1Dkj2Jx4iqOpEciiw/dqXN+Rvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFazmnfzI5AqtxfVbeSAKr1rvH0/0v50kpmAv4BNRwSfwmC6KqCDJWmA/DCvWK9XGqgQhqu8FDK2BcO7k2CiRszo+g3Y5D1YZcbnl1Qs99afs4Snzkg2ckFnCLKwxRCrng8IxYifUEECwqwfWrpmEWZ8WRyUklzb4gtSqNkNDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FX9u9wcf; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FX9u9wcf"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f8893bff3so2058011b3a.2
        for <imx@lists.linux.dev>; Mon, 11 May 2026 10:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778519414; x=1779124214; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wXPv9NMuATRuOngICuHBognry2tLHdZTtLmZBPko5FM=;
        b=FX9u9wcfK3wGmxKxtkupcxt7/n+XnaSzrzQ8/0EvZEEHa068mImlSPNIhJ7TBljPcT
         9GsLHfezX/RegFO/rax2uw+MMuJVABfE3g0x8OEn0oxZTb4jxaPJRVilQKOp8hn2B8D0
         MzQ9+0PxTPuxqtzBk1BweFJf1xxaAY3rZRPlDrqAcpK8/2epbpTjSID8kk8p0g/sUtSw
         f1duCrcnATvcWjokXUVoYoqnVDpsqC4d3VNvJtO+2fA91dz/vo9cLx7IRcl6uDbT2Hta
         uvi6Vc7iMoOhPwUmxH9UqSNYV/dJ7NvDOxMXvauMp9y5YXsOmTXArbxGnFHpyInsX8c0
         5dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519414; x=1779124214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXPv9NMuATRuOngICuHBognry2tLHdZTtLmZBPko5FM=;
        b=mLh4lhoQvFrcnVnm6i/KDfIZ8ff52vLnNZND6aUDq2REO1h0h8bwZjOxUTtulWUtMg
         pM1SfmUpxc8qvP5tjEokYjTZHEL79mQismLX5WYdeXUE5Dtw9GlHrQfM0tlR4cA/Fm+t
         Fl2zTpLXtviNMRs3yvdu2tCVlRmg/6cJzMwYfzRmY1xoZh4BcxySUOT35iYECsXibP3/
         qqYeCJrx7uXFj2+kjIKYIxaDAJYRa9QfxRElwelXWuOm2y3SbfkudibHVUecUZKj5Lia
         mydq7PQCYgeGGrboP+/w/ayTkR/9zD7n5p+hun3mB3l14BKRxqcL+21NWw4bCPM4kOjw
         VXDg==
X-Forwarded-Encrypted: i=1; AFNElJ+GCP+/xxxsq3dha3ehq53RVhYrfHCe3L7jPdNUKWYRTgNDAzxtzAylIoyCnO3Y7qKRPQg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4hbbTjVhOrVpSQg+gfaGoOPgckkBjBtmr1L2UeHCcAbsImnY6
	E4eRiKnuT9/crIujM4A3Z/y4Zodlfld5EuvQHMl7uo4GZAUduqKbM4AWLePkkDjZCRuFgJ4S3/N
	7XoBj
X-Gm-Gg: Acq92OHiGxvmsWzcSS+g3sQLYGPC1Y84LZOtVcj8DEorN6nEeuYDQJfhQFZOpFp5hgS
	kTexTF0xC9GRKvbFhmvYJjkheMG3WLF3Uh9ME4UtRlCfjJp/+2/idpU0E0pN8vVZZI5WBMV4iZZ
	m6JJ1lJYeliSD1YA+7oX9qNCTlXGLb7LpQhTY+im6M/NIrGXZplcsvB2k+WVo8S6VonWeSnE/3k
	81C9uxD6rW+8dabUO1ChGVW0OxN1bwtI4Sqg4PFL+jehwtvmqwgd6kTG3n3tjVtXWWHOHsqyNLF
	TxPntj7YPRCi5KUTv/7x+NVxpizHJ7JmWr81dw5CNBcZ52BTMz1jIrmg9z3bjGcKQjk1yYtAYlg
	nXBjrbLtNXgBZ6FakGZNqI8R5hP90d8FMXZL2wfCdPQgS/Jc4EtAe5u2cU4yqqCQlc+FdnyhovH
	H9rSASr51K+QkeHPbeU8EvcnucnrQ=
X-Received: by 2002:a05:6a00:f9a:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83e3bb9f9ecmr9882717b3a.38.1778519413426;
        Mon, 11 May 2026 10:10:13 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6a4f:ac45:cc0f:8508])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a52cesm19958782b3a.57.2026.05.11.10.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:10:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:10:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Jiafei Pan <Jiafei.Pan@nxp.com>, andersson@kernel.org, peng.fan@nxp.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/4] remoteproc: add Cortex-A Core remoteproc support
 on i.MX platforms
Message-ID: <agINcH6hVf8G_T_3@p14s>
References: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
 <agF+iYRfUIoBu35M@shlinux89>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agF+iYRfUIoBu35M@shlinux89>

On Mon, May 11, 2026 at 03:00:25PM +0800, Peng Fan wrote:
> Hi Jiafei,
> 
> On Mon, May 11, 2026 at 10:39:24AM +0800, Jiafei Pan wrote:
> >This patch series is to add remoteproc support on Cortex-A Core of i.MX platforms:
> >1. Adding dts binding for Cortex-A Core remoteproc
> >2. Enable Cortex-A Core remoteproc support in remoteproc driver
> >3. Adding dts example on imx93 platforms.
> 
> Normally, we only keep one patch or patch series from the same author that
> modifies the same file in the review queue at a time.
> 
> You already have a patch for imx_rproc.c currently under review(got R-b, but
> need Mathieu to handle), so this patch series might be delayed to be reviewed.
> 
> As I have replied in internal, to make multiple OS run on Cortex-A SMP without
> hypervsior, some GIC changes are required, without those GIC changes,
> this patchset is not testable using upstream tree.
>

If that is the case, please re-submit when the proper background work on GIC has
been merged.

Mathieu
 
> Thanks,
> Peng
> 
> >
> >Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> >
> >---
> >Changes in v3:
> >- Fixed dt_binding_check warnings
> >- Updated prefix of patch subject
> >
> >Changes in v2:
> >- Update arch/arm64/boot/dts/freescale/Makefile to add new dts
> >
> >---
> >Hou Zhiqiang (1):
> >  remoteproc: imx_rproc: add autoboot support for A-core
> >
> >Jiafei Pan (3):
> >  dt-bindings: remoteproc: add imx-rproc-psci
> >  remoteproc: imx_rproc: add support for Cortex-A Core
> >  arm64: dts: imx93: Cortex-A Core remoteproc device node
> >
> > .../remoteproc/fsl,imx-rproc-psci.yaml        |  51 ++++++
> > arch/arm64/boot/dts/freescale/Makefile        |   2 +
> > .../imx93-11x11-evk-multicore-rtos.dts        |  39 +++++
> > .../imx93-14x14-evk-multicore-rtos.dts        |  39 +++++
> > .../boot/dts/freescale/imx93-rproc-ca55.dtsi  |  14 ++
> > drivers/remoteproc/imx_rproc.c                | 150 ++++++++++++++++++
> > drivers/remoteproc/imx_rproc.h                |   2 +
> > 7 files changed, 297 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
> >
> >-- 
> >2.43.0
> >
