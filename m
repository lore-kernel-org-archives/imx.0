Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792392;
	b=jDUNSnR6SzgRH0Lo0yqiWFCV1aUbP8sh2V5Mbh0cefBXaeUnKeqcgn0rxpM+2rlSJkqv
	 7oV6XhM4vxgklh9xxibflJ5tUWhO+MCOUMBcHMzg62bJMHUZkfJ4Njchwd8H/gBqiEByh
	 P0kyAeBTwWqzmzCFI1NtX2lH0VIv5t7mg6ezGX80aaaozRrhx6LNH0ASeLIBo6pwT+dXz
	 jFcJiP1Yk2Ip7JNh2hAXhkwjYQTm4PAmDYTpHjhRjO9DQi+vMwY27g90x2KdSC/sBCCYj
	 BOROVluYjrtWm2gaHiHtyRfV1xvwZ3xQ9DBVW3QLabVVBYO06QdpikCA5RhFhn3ULFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792392;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5F9d85SS67tIWWxjbtexXqJlwkB+lmmVs0TpaRxgI2g=;
	b=try6IxlZVSGgQo3MtzVudU61w5cgbBHLC87l4LpfKCEnWPBiFdPGzN+Tl0aBbXnP5F9q
	 rFaSpUyxWAZe3ZRC0MfOyER4FS5HZE2z5XMOyfbp9WhSkYw6H3JCUEaKbTSUgasr3/bkf
	 BZIMcaJTnSu3HcjjTNjOQ6xueLeRkx4jWAZIyJ4jY/mcdsNhb49hbsZpJT/B76Y4YcRKz
	 IZPh+1mp66CdlnZJagfZocdlnyI9N5ObGVIOM/XlR5DJ5sfT6628YiM7O8xEUDSIqQo4R
	 ZBrRuO6UX0qjHFVnQKX5VMiWDyHlegrH7wKn3a0kZ240M1pzTnxTnPITPgkntA7LpeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJVSOhXA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C50606A326;
	Wed,  4 Nov 2026 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJVSOhXA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419C71F000C1;
	Wed,  4 Nov 2026 11:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793792391;
	bh=5F9d85SS67tIWWxjbtexXqJlwkB+lmmVs0TpaRxgI2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EJVSOhXAPSFuzToZKSayr0Ng2kfgqQ2+Rl7GhauV5mpywvFPAF8miT1zE+xmrMX39
	 LKFuDA2qgOK9YZwPRyq8e6cXTIXvn48MrjrvXALQZAI/PyKc0DBOg/+7zM/PU1T1vO
	 VCBXQOQDig5e3mqq+6WZa2kgrUwmZeomQX2AuIY8gCqXKLUa1S6j4FEXfHz3vMI32t
	 M0ngSaJjDc6IpOk15lUZCERU++3euItfozBCPsfMM8rv0mPYG3r+ja1RL2xITB258E
	 hM099TM8t4biruyLE2yWL0LyIhjdeKqeEUohJaN0a6G3tOal5SKQF/af3iSSQQCwx3
	 T4xS+umOGZ1kw==
Message-ID: <sashiko-outbox-197190@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: imx-audmux: Convert to subsys_platform_driver()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
References: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:39:50 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: imx-audmux: undefined macro subsys_platform_driver() breaks =
build
--

commit 9704777f69127c7bff10f89c72ce44590893c56e
Author: Peng Fan <peng.fan@nxp.com>

ASoC: imx-audmux: Convert to subsys_platform_driver()

This commit replaces the open-coded subsys_initcall() and module_exit()
registration of imx_audmux_driver with subsys_platform_driver().

> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index f8335a04595a7..d46f43ab66cf6 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -361,18 +361,7 @@ static struct platform_driver imx_audmux_driver =3D {
>  		.of_match_table =3D imx_audmux_dt_ids,
>  	}
>  };
> -
> -static int __init imx_audmux_init(void)
> -{
> -	return platform_driver_register(&imx_audmux_driver);
> -}
> -subsys_initcall(imx_audmux_init);
> -
> -static void __exit imx_audmux_exit(void)
> -{
> -	platform_driver_unregister(&imx_audmux_driver);
> -}
> -module_exit(imx_audmux_exit);
> +subsys_platform_driver(imx_audmux_driver);

[Severity: High]
Does subsys_platform_driver() exist in the kernel tree?

Looking at include/linux/platform_device.h, only module_platform_driver(),
builtin_platform_driver(), module_platform_driver_probe(), and
builtin_platform_driver_probe() are defined:

    #define module_platform_driver(__platform_driver) \
    	module_driver(__platform_driver, platform_driver_register, \
    			platform_driver_unregister)

    #define builtin_platform_driver(__platform_driver) \
    	builtin_driver(__platform_driver, platform_driver_register)

Because subsys_platform_driver() is not defined anywhere, building
sound/soc/fsl/imx-audmux.c with CONFIG_SND_SOC_IMX_AUDMUX enabled fails to
compile and leaves imx_audmux_driver unregistered. Was this patch depending
on a prerequisite patch that introduces subsys_platform_driver()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104113228.1634=
005-1-peng.fan@oss.nxp.com?part=3D1
