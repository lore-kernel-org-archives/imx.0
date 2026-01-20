Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9BA3B530D
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768895718; cv=none; b=KTYgoWNG9M5zXpZorAiVExLwBxgPw8WTwzxPIdFe2sR5QQ7FKCuuj8U45bnH7TMnZabJB1wn4l+xSkxqXIv8cEOrGcC66talvYLIifwyHvJakqry2s1cu/CwtnwheqhASifmOhSx5h5klpPlfryll18mjkNdK+yEW6AshFQjmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768895718; c=relaxed/simple;
	bh=TMLsqINFJyrKXhaZG2FJM4ezyn4y9q99PGcQ/6K3rFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYxii3F7W2fTbsOTa3BWQg5cVTNWdC77GLhj834h9A/m8igTkBGvOWhHaDklqgW9LNpT+AXJQpwRSbI5BeVJiNdeFrtJGDwP4TZu21dt4WtQMYUfHoxJ4FyVV7y75K4wRzDoLVdHqsjD76MNJRygKqvMQHUgYzyggpuFeinpafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/tXr5tE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/tXr5tE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C234C2BCB5
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768895718;
	bh=TMLsqINFJyrKXhaZG2FJM4ezyn4y9q99PGcQ/6K3rFU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=G/tXr5tEc0bh9MMiNSesbvugEyi50Bk0CHNTI/FVHiJS0VxmBoDAkcouLbbyP6X73
	 1AfrZ/mz0q80YKXuv4emmR5b6HvPZwjcZ1KRkzU3eJtQrk0soK14IMi3brnNahlUuK
	 N/8SucSBjb+SxTTVMS4SnxT1jCcwU3bxqkZd18PFkg+EtUfwHVFQOOD4lAFS1ONPa8
	 JceW3DzM9JjtbyBa/fI1j+5t1ygR5eFl5VqeOxX2w5p4TaLbtOfFmYC86YSQJBYRl1
	 Ag/32MrQAQrcmZnY+G533tdxUfo2VDLxFWb+KLV+VfkGV/+paMXQpckr21Nx6LzBtq
	 Rjp5CPbyRZ9Uw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-382fa66fa9dso38409671fa.0
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 23:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6F/HE7scyLhD0fVBthaWdYK6jY+XwTVZm+pygEeKPH9ObswblGok4bcZ0fnOZAM4MP7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+u0JoXbvPTQ2kH8gIevOfSQ1aQVe+NC9dsSffs8dfPgsO1AuZ
	BBVCOjsQL/3lFnd6Y5f5h0+LTYPN3AzCERUnaH0CI7dnJFlTVS2LDNIS0IBRMtbEZdKGaOZd4S/
	0UmPa355TsMtDjXManC8n1+ah9M99/Gk=
X-Received: by 2002:a05:651c:1443:b0:37b:97b7:a048 with SMTP id
 38308e7fff4ca-385a54354fbmr4917361fa.17.1768895716136; Mon, 19 Jan 2026
 23:55:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 20 Jan 2026 15:55:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
X-Gm-Features: AZwV_Qj3MBFPhHKAOhUS4trI6djFD2VyeTyhcWYMtPVh-frJE3FOzmJGjGidA8s
Message-ID: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 6:40=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper functio=
ns
> to retrieve the relevant information.

I was somewhat expecting a matching change to the Kconfig to add
COMPILE_TEST to the "depends on" line.

But maybe the case is already hit with ARM=3Dy && USE_OF=3Dn ?

ChenYu

> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/soc/sunxi/sunxi_mbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbu=
s.c
> index 1734da357ca21b249740e089698275507ea98a8a..8bc5f62ff258837d3f3b30cb8=
4b60d1872b31c27 100644
> --- a/drivers/soc/sunxi/sunxi_mbus.c
> +++ b/drivers/soc/sunxi/sunxi_mbus.c
> @@ -118,7 +118,7 @@ static const char * const sunxi_mbus_platforms[] __in=
itconst =3D {
>
>  static int __init sunxi_mbus_init(void)
>  {
> -       if (!of_device_compatible_match(of_root, sunxi_mbus_platforms))
> +       if (!of_machine_compatible_match(sunxi_mbus_platforms))
>                 return 0;
>
>         bus_register_notifier(&platform_bus_type, &sunxi_mbus_nb);
>
> --
> 2.47.3
>
