Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494409;
	b=1OQCb9fxOwWT0BnrKINib1ufRC4wg8QwiAnsJBUgX1naOpXTeSrVZoiWkpYFYmoWTTCe
	 w3M+VSZM6yHE8qCIl0AKx8hrH2InKNfnbfuYnGHYkVd8krc5GiNQ0KEAIvcaZSANmTTpc
	 zPLjN4qUkxeX993AGHgZJeFLoI1K4PBY60pBBLdaqLy2nDH1drp9EesHEzVRdPXlsFVLC
	 W3PZpFV4iiDOAdMw7po3rLWrdJSoX08dAD0v28/IY+RRDbu+2fQg4o9cWo2Zl5wPcqoaA
	 6Nb69Q3QePzA+1yVS580rNk1xTXCj372yvOdW3CuciC1DWgpSETX+RDUbn6r79Flqtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494409;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=nsrfJy/ey4fDpT1tLiGBQkd5nhrqessg78qrhYlxuN8=;
	b=pi1foDMxvj+MtgFOpsjGtWh98n85N82/6r8uYIgAmhnRwNxlbP35bk/0DZ+FP0IopIvK
	 WdVN7O4WY2r+vsZY+lQzs84n9i5HJy4OaqSR3vLrIqy7W8OD46+XzhlXAXMojNuKZX4JD
	 yAiIKUnVBAZYgEZhncgUF3RomCq5mMfyEyA7B1rZJgYTRE0yjUX7AA9CbMc0yar9TAI6D
	 fcPzLy3UGkMziVmzJrz5cGEQtRL+oI5ie/xfAIKKKnY5/VHvyHlFu3cMN1rtELV7UtuTz
	 dme25yX3A7U7jlHyXJOqw13GfObIOSD5mQZ4sblyKDcFO5AS8Cj0CHihrqiuT3bhmJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=d3dYfp1A;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55DF606A31A
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 11:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E55DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=d3dYfp1A
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id E5404D2328;
	Tue, 20 Oct 2026 14:06:37 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro E5404D2328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792494399;
	bh=nsrfJy/ey4fDpT1tLiGBQkd5nhrqessg78qrhYlxuN8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=d3dYfp1AEenlAqAJAsf1d1H8SA57AMYvrFbObQbVxMBs5fiEzwYZdlpXE0Q92jZ/3
	 yKlRMJnDXYTUEyPCvdyiUDPBFtFulR4AiQtLFpKJe1aFTL2ghqh6OuktMBYbXEthqx
	 a+E5upFPrQKIPjxk3mB+tjir8IWPFbDVakxVsLzUUXRCAxYICEPsN3ulPaIwNt8SnN
	 je2YOes+Z45PDuJWot4+LBy306Nho3uw239mXQKqW+PvAHTLjVYN+wf92ttqFeffX9
	 Mcd+GeeysGd/6kW23kdiV6meWXGAyT1bEc+4AKycBs6eWzSdjYOGfK+y4ky4cq/q1k
	 XCK/rIOoMLNlw==
Message-ID: <c01c5b7ceaef8fbdee2af384f2286f3a89350f46.camel@rendec.net>
Subject: Re: [PATCH v6 8/9] genirq/irqdomain: Add
 devm_irq_domain_create_linear()
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Tue, 20 Oct 2026 07:06:36 -0400
In-Reply-To: <20261008090231.796511-9-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
	 <20261008090231.796511-9-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-10-08 at 18:02 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>=20
> irq_domain_create_linear() has no devres-managed counterpart, so a
> driver that wants a linear revmap domain tied to the device lifetime has
> to open-code an irq_domain_info and call devm_irq_domain_instantiate()
> directly.
>=20
> Add devm_irq_domain_create_linear() as the devres-managed sibling of
> irq_domain_create_linear(): it builds the same linear-revmap
> irq_domain_info and hands it to devm_irq_domain_instantiate(), so the
> domain is removed when the owning device is unbound. The return
> convention matches irq_domain_create_linear() (NULL on failure).
>=20
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> =C2=A0include/linux/irqdomain.h | 30 ++++++++++++++++++++++++++++++
> =C2=A01 file changed, 30 insertions(+)
>=20
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 73c25d40846c..b6b360cb6525 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -457,6 +457,36 @@ static inline struct irq_domain *irq_domain_create_l=
inear(struct fwnode_handle *
> =C2=A0	return IS_ERR(d) ? NULL : d;
> =C2=A0}
> =C2=A0
> +/**
> + * devm_irq_domain_create_linear - Allocate and register a linear revmap
> + *				=C2=A0=C2=A0 irq_domain tied to the device lifetime.
> + * @dev:	Device that owns the domain. The domain is removed via devres
> + *		when the device is unbound.
> + * @fwnode:	pointer to interrupt controller's FW node.
> + * @size:	Number of interrupts in the domain.
> + * @ops:	map/unmap domain callbacks
> + * @host_data:	Controller private data pointer
> + *
> + * Returns: Newly created irq_domain, or NULL on failure.
> + */
> +static inline struct irq_domain *devm_irq_domain_create_linear(struct de=
vice *dev,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct fwnode_handle *fwnode=
,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct irq_domain_ops =
*ops,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *host_data)
> +{
> +	const struct irq_domain_info info =3D {
> +		.fwnode		=3D fwnode,
> +		.size		=3D size,
> +		.hwirq_max	=3D size,
> +		.ops		=3D ops,
> +		.host_data	=3D host_data,
> +	};
> +	struct irq_domain *d =3D devm_irq_domain_instantiate(dev, &info);
> +
> +	return IS_ERR(d) ? NULL : d;
> +}
> +
> =C2=A0static inline struct irq_domain *irq_domain_create_tree(struct fwno=
de_handle *fwnode,
> =C2=A0							const struct irq_domain_ops *ops,
> =C2=A0							void *host_data)

Reviewed-by: Radu Rendec <radu@rendec.net>
