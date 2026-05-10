Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295A6371CE6;
	Sun, 10 May 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778410120; cv=none; b=SaQLfu+M9YlzgT+vczCenMykL6A+dIT/fxARMb38XO8uFK9D4/1RrmG6es24Os8R3W9Vlf1tQ4d5xOZz86AGGSHZ4T/DhC5SSlekitzQFuivDrJrACitiC14huWBErsWwZ59NBIiR7yyueM4f6AGyhNvA+2LzCj6TDmPsB8KX6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778410120; c=relaxed/simple;
	bh=aIbJ65ouYnpLea6lch/3Ldro0q+OwvMunQ4WQNfth+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ct6bUlvS3OWJFjDUUvoYOYUSwcbc1TrVrJyUCbyLXKJvKZbQsmPMs4OFdVu/EqqMa9jOeOcoRq18fkQPBuXeovWlQd1ZU5xOydH4w/9rEewTso4k7ftdnwLMKoAbAWhNpFR8EdEuofft0PSvUGgELFAn5LZsurWNmjbGi4URDTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+SyqJyL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+SyqJyL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696E9C2BCB8;
	Sun, 10 May 2026 10:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778410119;
	bh=aIbJ65ouYnpLea6lch/3Ldro0q+OwvMunQ4WQNfth+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=u+SyqJyLjKJdi8i66PyuRmY7rYgbYBshZQsyUm+ZRZJyI046WGyl7pB2Ucfd/xSLb
	 x2ZKi9EML/DR9jGA6JYJUCou0litjUnVZI/NkD2zWp/OOl7QR1YLzYhrSbn1VgWpsa
	 ikMm//XCoD7Oh8ByXq1F4wE/ZiUmAr3KwRSkmK6WMffhc5MDrcbrCxNfE92i4Bm7Ss
	 B8oEmoZtv8hnEGx6o377vt2I84sO7TBTSzPFb7D/qfMm+s3EvrHM9mexLmZvy90m6r
	 Ul+Yijecnb1BCspKIq3VRHZRhGTYws+7he8dNRgsy+WOWBBhSXzljRFJU/jGOnEJEO
	 1YC5Mmf+df4ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 net-next 13/15] net: dsa: netc: initialize buffer
 pool table and implement flow-control
Reply-To: sashiko@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260509102954.4116624-14-wei.fang@nxp.com>
References: <20260509102954.4116624-14-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 10:48:38 +0000
Message-Id: <20260510104839.696E9C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The IPV-to-buffer-pool mapping algorithm fails when a port is al=
located more than 8 buffer pools, silently routing all traffic to a single =
pool.
--

commit 0b5e4aba36a49ce1de9eb84ec706f482331550cf
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: initialize buffer pool table and implement flow-control

This commit initializes the buffer pool table and implements flow control
for the NXP netc DSA driver. It adds logic to dynamically map the 8 internal
priority values (IPVs) to the available buffer pools per port based on
hardware capabilities.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> +static void netc_ipv_to_buffer_pool_mapping(struct netc_switch *priv)
> +{
> +	int bp_per_port =3D priv->num_bp / priv->info->num_ports;
> +	int q =3D NETC_IPV_NUM / bp_per_port;
> +	int r =3D NETC_IPV_NUM % bp_per_port;
> +	int num =3D q + r;
> +
> +	/* IPV-to=E2=80=93buffer-pool mapping per port:
> +	 * Each port is allocated 'bp_per_port' buffer pools and supports 8
> +	 * IPVs, where a higher IPV indicates a higher frame priority. Each
> +	 * IPV can be mapped to only one buffer pool.
> +	 *
> +	 * The mapping rule is as follows:
> +	 * - The first 'num' IPVs share the port's first buffer pool (index
> +	 * 'base_id').
> +	 * - After that, every 'q' IPVs share one buffer pool, with pool
> +	 * indices increasing sequentially.
> +	 */
> +	for (int i =3D 0; i < priv->info->num_ports; i++) {
> +		u32 base_id =3D i * bp_per_port;
> +		u32 bp_id =3D base_id;
> +		u64 mapping =3D 0;
> +
> +		for (int ipv =3D 0; ipv < NETC_IPV_NUM; ipv++) {
> +			/* Update the buffer pool index */
> +			if (ipv >=3D num)
> +				bp_id =3D base_id + ((ipv - num) / q) + 1;

What happens if a future hardware revision allocates more than 8 buffer poo=
ls
per port?

If bp_per_port is greater than NETC_IPV_NUM (8), q evaluates to 0 and num
evaluates to 8.

Because ipv loops from 0 to 7, the condition ipv >=3D num will never be tru=
e.
As a result, all 8 traffic priorities would be mapped to a single buffer po=
ol
(base_id), leaving the remaining pools unused instead of maximizing
utilization.

Should bp_per_port be clamped to NETC_IPV_NUM before calculating q to
prevent this?

> +
> +			mapping |=3D (u64)bp_id << (ipv * 8);
> +		}
> +
> +		netc_port_set_pbpmcr(priv->ports[i], mapping);
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509102954.4116=
624-1-wei.fang@nxp.com?part=3D13
