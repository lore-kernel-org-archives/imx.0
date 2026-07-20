Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108BC3DA5AE
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566212; cv=pass; b=SjYPCLRPbSaLJFve4P/ZNucaUNXJLsnCseE72Igz8gXc5yWpzOZGStfbx7tRiS0nIWsliNdwV0J61/SMtS06NRBcRw02/Ecj9CIm4OlqUK1efZHQMFZUnHhoryCgM7hYeXhgH8/dQtM2apDEnad1uM/eKEG4deezflKfm2foibQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566212; c=relaxed/simple;
	bh=mV4C844nkmkraNjWpzUFEfGiayI1N+j0A/3+fC1As4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrxiURFz6n7i2mrbxsc++BXfZJqiDChg+h8tTfuxJ4Br26yVXKoMMirFngyEOvmbcJiBTXRpFtQe2o/E4geLRzV9ghipuTIhe3BTk0Is5X5C7/JcoPBg5uVcg2QX+C/m9dmhh0smg8IVkpaZ6YWsKkKOljdmUc1yALl6vf6IOdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gE1CaxZg; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gE1CaxZg"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c169ae1cb26so709628066b.1
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 09:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784566209; cv=none;
        d=google.com; s=arc-20260327;
        b=qoiO16gUNs1O7W9WUMsmtGK8nH6byCOpF0lxJnqDXcylqoN0JQcs7YdO1Fzqdvu0o8
         l9yI7eFO1DBmnRsBSc+auX1VM5RycNhhUAHs+X4fXbtQ938N8kYyHrb3Ji9Uq9Hjo8Ba
         EpetMthg0ePGM09wHjN49cb9b5E9StkDE5MudNeNDjmk5j8bowzD0ypaAADyr2d9qDzT
         TbxV5W8IsKg1L7BqyD97hyVbCGnhbqu6b3DP+L2BuJOxoO0wAqiekfm2BwpknyFz9XAE
         g8fJX/x5Jlxap4c9ANkSFQ63Vo8SNW+bQcvijrQY7Xl/yOlhpKi2q96ULFzhmjWqtbtB
         VphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=163N5x68jnVbNG9W8e+t56UKy71p7BqItDDn6Xltr7c=;
        fh=w/eySo7IZnEz78z7o0OpdBperCDUvQT4cV6Q30qde+k=;
        b=OCxvSHMA5cUKwowg8VDHgrOGhDh4d+IdYfV6CuCSZrjjlE6jRXSpsqKN5HyFJ6Sldq
         CmeRLCPI1xMfh8QDKJlqmlDg4z2e74Tutx7THKa622i7Y+IBPrUADPhng+e4reaacYlx
         J2mXSWxW1BWONuJOVE08Sro9hMA0sHULUlN33GTXfI4ULBQfXBXJ7GPoGsRVSfItCCbc
         zEFoKz7iWfOppAhbRoWN6gRYdROj/dkxauK75zjIblF8pb82uq7eHvhsbm88uNH4t5XV
         g98zKUUzhIyN0L4FwSCVn3lVl5MQ8Zxl2q/kJ3jCK7uso/8Fo0g/dYtBk8h6Er7vyke/
         KTkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784566209; x=1785171009; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=163N5x68jnVbNG9W8e+t56UKy71p7BqItDDn6Xltr7c=;
        b=gE1CaxZg3DZvfc8gHtQiF7POPKuLmBB9VIznmLIGnLLrilM45CmBTu18QPM7+Jnb9j
         cFkaPPwJQ+YdlgALfVz4FjwkuYR9hImgm4Pic/6nh0uTnZVYKYVAQHU6/RRbUfFQAGx3
         qRkFLXE6q3s8SKBu7BWTGpijGGpw68lULLoIPBy4QBtGOlfzrGhZSGkt56sMziSeWWvF
         olaBaEwOpFqHaHasMVkaqB6fC/UQAr+zQe4QeATD1BeHlPrfJUjy+VNLpMBBuoBUpIuJ
         bg5jkvrnhGAcdZZhg6HumSYogH7yCHkN2uh9Sokg1sA0Ko5wL5WnieGH5SNwwhqG6cab
         gibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566209; x=1785171009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=163N5x68jnVbNG9W8e+t56UKy71p7BqItDDn6Xltr7c=;
        b=UXmb0fsniiaZ2ToeQfATMT79OyQhuaoDK+1Vt48H4NVoesxLTfcOf7tvEHc07/Nfg6
         5gSjTBRynTku2U0V9Pgrunq/xImBD9u0Kq1MRvNwcvvCBTeDaUaj2JGd4Ql/y1vHnWrL
         tvhKx1QEMAFsckPnEyAcZee28p+ltsAUk8BeY/DQfshJtpYQrJbKKuKKuFF2Qd4tZZpx
         tLtzeSwzku8dDqsAZiyCnsKwH7tOXcAr4vzZTiIGypywnLed4Ls29QEnudnAPJh+tz86
         yOEV7NTWGDMV1iJyPC0ahDEbM22knbiMPfP1D+oW+9JJKDe4d1yJ/p5012mFxnOBtLEF
         JWnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnVIBXyfWf+fSPTXIWmCCWEM7JGvJHsjf/aXr/Bd8hMJE1BvJyvF/iOlm642cTp/HlxmE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjGQbBOi3PALEGR2itb0egUNsBPq/Qm+bNaltvdMghVgLp/lK9
	hsnb+txZy2Cxj7EJeRZnuHad/M+5qmdRi6SKKb2sz40RFVni+M0jSEzn6N+zmlpvKAaWeS+Gka+
	hfwHRJBhgiauIFZNWKoh/gaWvKW4vOso7d1andvke
X-Gm-Gg: AfdE7cnaewXq7I4WsXnf6gkJxyL5BM5ilJ48KipBz1keWegoVucP4vcaFsCcdlNDmhL
	i7I9BU4UyX4wPDn3zdNHTxuM1KDyLcx2AfsNuwNttXO85qU8OlolraaaUdfX/ajVwKyvcWTI/F9
	G1uH7yxrMJxJzXlmirW/P4P33Vj0MlS27ieFov+RYMSwR5w8pqLO4jlmOIinuj23XdxJDopDJJB
	3Flp3C6DtdG/nYUVzsoqm3LJwseRLjDmcDdbK5sO58VvBERONUORI5arVBCanHtZfGOnh2b3ACo
	kaerGwYyLP1VRQAjSSwqQg754uyC3t57YM0afPtCq2np7AjQZ2brO2CGE22or3W2xBmcVHbi26n
	P
X-Received: by 2002:a17:907:e917:b0:c15:fc5b:b667 with SMTP id
 a640c23a62f3a-c16b40f8999mr685752766b.19.1784566208840; Mon, 20 Jul 2026
 09:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717141648.1007059-1-linux@yoavmoshe.com>
In-Reply-To: <20260717141648.1007059-1-linux@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Jul 2026 09:49:57 -0700
X-Gm-Features: AUfX_myCkoH_ohyvAhDykS-FTisAi77kahkS1sYBNzC30PdiB5itO0E3RJF3Z5w
Message-ID: <CAKwvOdkGYLWAR+5q+XaO6VZc3-sGEm0nX0MvXoJOghx7Gn1tRg@mail.gmail.com>
Subject: Re: [PATCH] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 7:17=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> Relocated suspend code in OCRAM lacks compiler-generated CFI type
> signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.
>
> Annotate imx6q_suspend_finish with __nocfi to bypass CFI checking
> for this specific indirect call.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>

Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge.
> Before this patch, suspending the device caused an immediate silent
> hang requiring a hard-reboot. With this patch applied, suspend and
> resume work successfully.
>
>  arch/arm/mach-imx/pm-imx6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca498..d9b0c1803 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c
> @@ -360,7 +360,7 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
>         return 0;
>  }
>
> -static int imx6q_suspend_finish(unsigned long val)
> +static int __nocfi imx6q_suspend_finish(unsigned long val)
>  {
>         if (!imx6_suspend_in_ocram_fn) {
>                 cpu_do_idle();
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers
