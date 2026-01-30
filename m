Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECF941C62
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769784460; cv=none; b=dhDwa514y6tzIRIj4UiXn0K+VhAH3V9PvbUHMCiPMiWAigXGgwTWsogtKPoFAa6KRHZyDsLXW2JU9BYZDXrFEjbqXL5eKG2uOSyYOdpeL0u+GYr6mjyELN1Ss2ILTMB1c1tEhPl3eOsdLTs7Au0tpJQZutSgkRc7vmRV/Ll44QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769784460; c=relaxed/simple;
	bh=l0NK+L1zbI+S1elZ/cP/d0bNA/FxXgDqcRb+gufNh+s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=irBSlPGPvVeEM8ClBSveo0GU+enexrsUwJuP0BaDdAZAsAwamkPbff0c4nJ+fWDRSVY+Wovd2tucAjm7BX0VT0HGyr0j4HCFK0p++e4TXy4ptiztZe033ZRWykimYuxs+UMJG8TW82VzCWqC5xhgZuzRpGckx1sEeZ2Ab9cSWd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=18sfYU22; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="18sfYU22"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5036d7d14easo22021661cf.1
        for <imx@lists.linux.dev>; Fri, 30 Jan 2026 06:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1769784457; x=1770389257; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m2hfas+OWqJcbZ6w1+Kimr6HVSADO3LaGmzUbd8jJBA=;
        b=18sfYU22YS9ubQRGQDLj/LJuKCSCLSk2uYclnjEq2SS0/McI1VPQM/Beb0yvqM57HK
         Z/cmMD/0X1+wqKFKO9skoCOxykcPCVapkiKoaH4/L0nJD7StYa4E7chdC2KAqmKPaGOp
         OamlGTd4Sew9run2A3xxgxS449m7/UbHrlibZkhJ+Xeh0rI6ttVA33Bi0RUqKybdIg6H
         fqJXC6UQ9E9zkVj+9ccaGJ8GX2oPbbfDydr+Ty4el+sjnd1n/Ga0PQyYHvmzpYhn2GeQ
         AoIhky5JL4JkNbcYeW2QpfLgNqD8JOE2doZ8VHUxXmrWajnPxksJ0LGjWVkflgfns70x
         iy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769784457; x=1770389257;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2hfas+OWqJcbZ6w1+Kimr6HVSADO3LaGmzUbd8jJBA=;
        b=NtHpBnlmHPDhLtXDEpkVtrPASOpzW0lNi5WpEnq5dP9EMvO2HehWQkIy31nXJceJO8
         +pXbygGL9Meeml8C1jH1vwQ2MvhTfJZgSj6FmNOOScek59ZsBW3D9t9GRCM/K3fKaIXQ
         j69UM8BqPbdTjY/Sj/QUa9vrO8+QVKZnQ+GBBEKZxbm5gwgX3YuM+ZI4WhyRBzvs6+W3
         9u7xsefvPQtrK3Pl5qCRArtgL8SS+k809gZnNHsyDCEFoa15IFIs/qdMxMkapMN05Pfk
         xa2PNLTiNe4sTy4MV41BVjT1OZLN7Y4qtO/QLip2CNP5ZdvQmu8001IQ21pMNSqy1g79
         Sm5w==
X-Forwarded-Encrypted: i=1; AJvYcCW7nxLmbq/tbrLwNkRp9g4MmPfcLekXU2S6xHroViVcdMekwJmDeHWcAFS7ezgMWAFVaF8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfm2xwyu82w+8nfWsI0xnieI8ZmgrAmkhOpWlSaEQUdi/HPBuw
	Dd21fW+mibpkduVh/oC8yOW9K3n4P6yB5OEWMLXPMrr1cGo0J3Hzq2t+qH8rFews08g=
X-Gm-Gg: AZuq6aI2/zAyuojYmG8wD+rz72Vg4t2/n2EBvJUChZN683fIGSEo3rROlVnhH2JZrY5
	w9sVNEC/BQEqpGxKkdOCCxA/ZkCXsnp0gg8QA8axMhJDHp5u039H4WQ3ZTcrotcbofGbKLSWYzA
	wkky3R7Q4VHyKFxEI1IVETq01TSpgzHdnv44aLB6h7M6KrFYqrgRcIF6XBA8YG+U1fw6onvQMqB
	x1cA3dd9MDms0dv1082fiX5fbQFhdpqKsvaLMngqc29h3BYh2U9YDgbklwiJgyYYq5+Ex95Fpde
	9E2Gs0OxYk7lg8JSJdyuTIKdUGF/ICMjk6FAXYSLl7JlLKDkqInRWSckRUYAf5uweprw2CDRfLQ
	/5HWYDNOk8/giEjEQz4BhDygDk0UFWWjYqlBhJSlxyZNBrcrCzwobiOVlog4AKJS/5IPU5cmKrC
	BLjBi901T6pwktzmbvlgecuzM6iSQ=
X-Received: by 2002:ac8:5a11:0:b0:4f1:ab79:fb18 with SMTP id d75a77b69052e-505d21c6bbemr33783391cf.25.1769784457458;
        Fri, 30 Jan 2026 06:47:37 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337cbde30sm58435431cf.33.2026.01.30.06.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 06:47:36 -0800 (PST)
Message-ID: <df8d5d5f28870752e77ec74f34fea7ceb6e97286.camel@ndufresne.ca>
Subject: Re: [PATCH] arm64: dts: imx8mq: Restore VPU G2 clock to 600MHz for
 4K60fps decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de,
 sebastian.fricke@collabora.com, 	shawnguo@kernel.org,
 ulf.hansson@linaro.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, 	l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 30 Jan 2026 09:47:34 -0500
In-Reply-To: <20260130084133.2159-1-ming.qian@oss.nxp.com>
References: <20260130084133.2159-1-ming.qian@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-i/sogahe4R0AwUuBxOvE"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-i/sogahe4R0AwUuBxOvE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 30 janvier 2026 =C3=A0 16:41 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The VPU G2 clock was reduced from 600MHz to 300MHz in commit
> b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock") to address
> pixel errors with high-resolution HEVC postprocessor output.
>=20
> However, testing shows the 300MHz clock rate is insufficient for
> 4K60fps decoding and the original pixel errors no longer occur at
> 600MHz with current drivers.

Tested on EVK, with the downstream DCSS driver, and this change triggers DC=
SS
underrun (which is related to the DRAM QoS erratas on this SoC). It also
sometimes trigger the "not all macroblock decoded" warning I added recently=
, and
we can empty IRQs, but these are handled now.

>=20
> Test results with 3840x2160@60fps HEVC stream decoded to NV12
> (the same scenario that exhibited pixel errors previously):
>=20
> 300MHz performance:
> - Severe frame dropping throughout playback
> - Only 336 frames rendered in 11:53 (0.471 fps)
> - Continuous "A lot of buffers are being dropped" warnings
> - Completely unusable for 4K video
>=20
> 600MHz performance:
> - Smooth playback with only 1 frame dropped at startup
> - 37981 frames rendered in 10:34 (59.857 fps)
> - Achieves target 60fps performance
> - No pixel errors or artifacts observed

That probably only true with the upstream DCSS + a small resolution embedde=
d
panel ? Can you clarify this setup, because the display drivers mainline ar=
e
very minimal. Would be nice to show you average DDR read/write bandwidth
utilization during this run for comparision.

Another information that bugs me, in the BSP code, the G2 voltage is increa=
sed
too, which you didn't do here. They also use the thermal 2 zone to kick it =
down
to 300 until it cools down.

Nicolas

>=20
> Restore the clock to 600MHz to enable proper 4K60fps decoding
> capability while maintaining stability.
>=20
> Test pipeline:
> =C2=A0 gst-launch-1.0 filesrc location=3D<4K60_HEVC.mkv> ! \
> =C2=A0=C2=A0=C2=A0 video/x-matroska ! aiurdemux ! h265parse ! \
> =C2=A0=C2=A0=C2=A0 v4l2slh265dec ! video/x-raw,format=3DNV12 ! \
> =C2=A0=C2=A0=C2=A0 queue ! waylandsink
>=20
> Fixes: b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> =C2=A0arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 607962f807be..731142176625 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -960,7 +960,7 @@ pgc_vpu: power-domain@6 {
> =C2=A0								=09
> <&clk IMX8MQ_SYS1_PLL_800M>,
> =C2=A0								=09
> <&clk IMX8MQ_VPU_PLL>;
> =C2=A0						assigned-clock-rates =3D
> <600000000>,
> -								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> <300000000>,
> +								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> <600000000>,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> <800000000>,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0>;
> =C2=A0					};
>=20
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> prerequisite-patch-id: 0000000000000000000000000000000000000000

--=-i/sogahe4R0AwUuBxOvE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaXzEhgAKCRDZQZRRKWBy
9PeIAQD5M45/PuqurizwtvrI3NE0hSFwAP/bvFLOeVBaM9GzsQD+PGBAYJjzNYYA
DPbDkSTiWXrcCwv7P2Bo3/hz5rdgBgU=
=/XEy
-----END PGP SIGNATURE-----

--=-i/sogahe4R0AwUuBxOvE--
