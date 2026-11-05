Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793847164;
	b=B7U+wAQPeVJDcylN5chbCX+EuCoRlXZWXPTFajk2bn2r4ijGy3eYwJQDx1ymT2+dnip9
	 pLlt8BSKP+CGq+JC4QiYM4lB7LkN0JjTwqj9EeGnrQTJINHB2fuojXbzixRRg8uv86Ms3
	 FqWVO8CBWvmILtHXvlAw218/cwWcyJpnlYIyW14kNAFN2907CDEoujwOqbPa59ctkO6xp
	 sVBW4WIAt1gwrexHtvw3Vn5rt1UXrTB5QZ22EvWxSSN0s7qQPZRN7Pzqar+5oJXWxmAPv
	 mF5wFoievVMUnkyIJ9cBQvblv0VmkBbkHBeGIZBP8rfcsRi6fCnu6KnAqCj2kO+TjSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
	b=IcFihKbDoOFGmNDswXa8GnHNkPgF2kQ3JTdq/CWapKkoi3z5kKB2BT+eyUnSaXMLgPQI
	 kAv45Smy0YcXXPWLY0oTyc47cMGiYJMRWUxKyPIiOue0ZS2cy+SIH7W+9hC7aI/hc3/3/
	 UeiBJ+a2p6bN7h4rh7960h7GpPLi25iyRbATQsht4Irj2pidRQYuB52MgShbQkJ44jj1e
	 kzQCWJK0WrtczAxrb3dIzEfwiWvIwMVxCZG4eBJ/cs+2ZAdHUI7lMFtbdNnd2t2k/RMPq
	 6zSg7C/6XtQqHA/VbhO7NqHk+vOTzMBYMHSPD4EaeMAcMOPpR0wNDJ/a+tHUF5cKm3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Alh8A2Zz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38565606A33A
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 02:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38565606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Alh8A2Zz
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a064dcfcfdso566740b3a.2
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 18:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793847163; cv=none;
        d=google.com; s=arc-20260327;
        b=qVpe4xd0v8oIi/OHQwoBPIVMe6qa4qXydwmZ+wTD0AHQarFRgmYYsEd8TMus1tBtEY
         Dua++WOm4IZrhsRavADBbDvpjO2Q7vIJJfP1C1y/wxkkX8JeCVYCMiiIHBU11Hg0T0U8
         IETpsdLv7ovCyjowokXKQT3unmKq8w15TYbmiG36G0Si+nIf02a1D1KxWdVFAFiUT4vl
         TQYhEPnSmvOneqSuJgU0zQvrrNssk+px7mBhSF7ylu60UBKs3+FhxcU7VnW3o5g5/533
         pzfsrdc0xhdyH3ed2ujiXihduf8M4D1VoalTtWU7L9gIrFAoEA/sAnYaarZGhRB2z5wG
         yEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        fh=emqPXA6GTlqovMqwqBLocnaoOsN/4YD67hAfwQ9s4Cc=;
        b=bQlHX9nSsT2OUAsGgfzywzYGiLcUk8Vr31tl4GAkgfTgW9qwUFydHMIRgnPid7j7kY
         MJq0n4staRC47d+h6WijBJHzAa6OzZzt4RDufsUYA4xpeKA7VZGRum/81hGyXWZeuGz2
         Hc5vQbPnozz2KxV5rlBgANbb7GI5H7GWvM5xRjQhHoyAu/be20qcpC904dOonPNFL+hQ
         2Ti5gBnghI0L9Rjhvt6TRgBXr0KhwLalJMtWzdn8Lrbh8P/DXCN/xNhQth3OPsvt1Hfl
         nf6uLiPIGXtIjhWVljDvAVR3exaYqNVq4TSWoMPj9weN2IQLwJp6/DoGqhAUfOQNRg+K
         I9JQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793847163; x=1794451963; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        b=Alh8A2ZzCI1/0XhdFGBv4XoazavDONUL0JB7OHsBAJbuA7w0gUadqcXInnBvdAj0Tp
         AeZNxXJ03ywhBc88kV98aNugMKXtezmDy9pQiXBpI7z2rQJKwQhkgTV9vhn/qPDiYy5M
         8r0GGAyWoPnsP7WZ+5Ln+WQrrY0mOqvavmjs2SBEe+2YZ6wkB8vBMrsjyKuLbG6A4pRZ
         cTCKXKmzH+7PpB5cT1g3t3Lx9MsAqoNBUMXRwJ7Xo4M7mEqxEpQ3H6dfidYrADa/olQw
         Ao3NpdtiROlZuvECVeN3iaFxPxHiS1yiCm+9eGdQJE6/C/MF6IZGtUngNC2u237m3v9l
         HE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793847163; x=1794451963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey1iV8iQoLj7ydlNgUyOjkiFHdD4l+/Plkd+sDU6ZFc=;
        b=x0SvZnqJvAnY0gfGVTZCH0ax8ojfaJm3oImf0SrFu6MIopuUDRbrGjgyWAP/NfuzBY
         uyYZq4tIt9w3WHbIAjN5MsijZLu9dCPS25Jrc3CXO2hgSCdnGTHz38YUARTtH/hwNIxV
         B4uXKn+B2gixY6bNA1FDdlIi1ZYfmSXjvfzvgHhQU9wMdslJgPre7eDzx3OeFb7sbymm
         3IBI/iWiNHEIf+dpkVtDY1CdgBKWU3nsC5O/CvwKH1FoI3AhW4tkBHSA9H5oPPEMCdK7
         J70eMftrysz7D5jM0gldlc6oDq7rHH6FELl6Cx0T3j5Qi/mA6JYV+SrQLMZHwp5NPChy
         XC+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxibJOYYALlggpsrqJPt1eFG4ltsSIU7B/HgV9uOKF4sld6VPQE6O8nSQwc/07wE0OkSxs=@lists.linux.dev
X-Gm-Message-State: APuU4Z94eS/5OUjHEFcA2UyG1RGncyWBfAkmIj8QbOl43zuDYl3f0jR4
	PMJImApaEe31glinE6/zJM8GukhJcLdWkGU/DGs6VmHYhK5jLfd7xWyGYBXFohPJ11Rk8j2NDWu
	pg02OfsoLqmY0K2Zfxd1j3O7gyh6OKHI=
X-Gm-Gg: AYBFou2wKEk17rG48rwGh2JMkUCffiQtayzW9F2hTBfadDTWYDu/dFPQ9Xr/JZlrRdq
	+SwSet/f3f5XMIFODJlv8AqEPUfo0lLuLsIWAqKyDNfAPjCjijX8Lg+GWf2Z9pNfDJar56eR5Yb
	jbGktEz/Q7wub0DQgM7V1Hq9b9dZf0LcSUB6d9aSXVvh4KuuPAOTafKULda4U6MGTixayDLecg5
	oN8YA40o25/B3QPNwV2xVRfliXiBcUlN+weUpIS78MG0zC8uDUtARBv/2ODxxw7d1swunJRufSx
	eD3oO6M5sX59/S1sEfjnX+gq1RMBTZXZvIaWPINV5s06sgx7WtHkuVDfRb8YTohN6qp0Zw1pok3
	+Nm/VAHsGuF7cFidL7qjKeRiUhTTWwwyt08Ee
X-Received: by 2002:a05:6a00:2d96:b0:8a0:5f63:5521 with SMTP id
 d2e1a72fcca58-8a9ba703d12mr13438966b3a.8.1793847163495; Wed, 04 Nov 2026
 18:52:43 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
In-Reply-To: <20261104113228.1634005-1-peng.fan@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Nov 2026 10:52:14 +0800
X-Gm-Features: AclHuK8gtw_SYmYC4rZ2ec9F7qmZC5mmmsY7xqdrym-SeKMj27M0HT9x7LVxGTo
Message-ID: <CAA+D8AM5Nr9vDzohQaz-XN=_F9dBfXoBJJv_3FS3jDeGQ_6G4Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmux: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 7:35=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
>
> No functional change.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/imx-audmux.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index f8335a04595a..d46f43ab66cf 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -361,18 +361,7 @@ static struct platform_driver imx_audmux_driver =3D =
{
>                 .of_match_table =3D imx_audmux_dt_ids,
>         }
>  };
> -
> -static int __init imx_audmux_init(void)
> -{
> -       return platform_driver_register(&imx_audmux_driver);
> -}
> -subsys_initcall(imx_audmux_init);
> -
> -static void __exit imx_audmux_exit(void)
> -{
> -       platform_driver_unregister(&imx_audmux_driver);
> -}
> -module_exit(imx_audmux_exit);
> +subsys_platform_driver(imx_audmux_driver);
>
>  MODULE_DESCRIPTION("Freescale i.MX AUDMUX driver");
>  MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
> --
> 2.51.0
>
