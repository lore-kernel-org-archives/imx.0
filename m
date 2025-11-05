Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D203168F3
	for <imx@lists.linux.dev>; Wed,  5 Nov 2025 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762355452; cv=none; b=SZj3+jrvnI85w118fYkw6bVD25AxAgyF/kG4AE1Spn5chOLF9/P2vVDJvxwU1vv5L876gLCq13cqZx/CAH+YeDqsorOX9BKj0a1y83pde6jNUDGEtwbsL0HIT1i2OWiL/FeuCKrKr1TQWssOPFz0ylRRdR9enh6aA6AZGyvQcPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762355452; c=relaxed/simple;
	bh=OjAxb9QR8u9JQcXq77eKB8IeA/NNyxUQGl+cwvR4fiA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eExD2cKJqCdWlNlmVX46T7qx6MjovdKtgPFhNY+6iKZFVWGnXdjZHerlInF3EA6qRApX6rikym6FG425OGFiH1XpaL6r6oTk73HAgzF7tXqhMcscF9nB1kdQlTzv0kXjSTT13SeBMwFW32nzmmT42eTJffQSicfvw73jKrEBU9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGf9j-0000l2-8Q; Wed, 05 Nov 2025 16:10:39 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGf9i-007DbY-21;
	Wed, 05 Nov 2025 16:10:38 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGf9i-00000000BT8-2G0G;
	Wed, 05 Nov 2025 16:10:38 +0100
Message-ID: <5535d4dbf94b01fe775b5f905afea8c860f9c03a.camel@pengutronix.de>
Subject: Re: [PATCH v4 4/8] reset: imx8mp-audiomix: Drop unneeded macros
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Abel Vesa	
 <abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio
 Estevam	 <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Shengjiu Wang	 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  Pengutronix Kernel Team	
 <kernel@pengutronix.de>
Date: Wed, 05 Nov 2025 16:10:38 +0100
In-Reply-To: <20251104120301.913-5-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
	 <20251104120301.913-5-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Di, 2025-11-04 at 04:02 -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> The macros defining the mask values for the EARC, EARC PHY resets,
> and the DSP RUN_STALL signal can be dropped as they are not and will
> not be used anywhere else except to set the value of the "mask" field
> from "struct imx8mp_reset_map". In this particular case, based on the
> name of the "mask" field, you can already deduce what these values are
> for, which is why defining macros for them doesn't offer any new
> information, nor does it help with the code readability.
>=20
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index eceb37ff5dc5..e9643365a62c 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -14,11 +14,7 @@
>  #include <linux/reset-controller.h>
> =20
>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
> -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
> -#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
> -
>  #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
> -#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
> =20
>  struct imx8mp_reset_map {
>  	unsigned int offset;
> @@ -29,17 +25,17 @@ struct imx8mp_reset_map {
>  static const struct imx8mp_reset_map reset_map[] =3D {
>  	[IMX8MP_AUDIOMIX_EARC_RESET] =3D {
>  		.offset	=3D IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
> -		.mask	=3D IMX8MP_AUDIOMIX_EARC_RESET_MASK,
> +		.mask =3D BIT(0),

Since the masks are all single-bit, and you make that mandatory in the
next patch, I suggest storing the bit offset in the reset map instead:

-		.mask	=3D IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+		.bit =3D 0,

and so on. That way it's clear that no reset control ever manipulates
multiple bits at the same time.

Either way, either in this patch or the next, add an

  #include <linux/bits.h>

for BIT().

regards
Philipp
