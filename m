Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169816;
	b=hUJCTDz1rk5kDiu4ZDAb015qYPYl8JIlsOuAXhREXm/YKy5oPlyAeCfAwfL/50afvv2m
	 GwRWmgbhQHgwJ9sjSa3oAkvetU0sQS53fm99qiGKgpHPjiUxgUExRVScaE6dQb0qMxQN2
	 AWur3vzSguwplEzHHY0+NtDlQsZYLo3bSLD+bM1YCeTx0MoLIucaozKPnMCHkVhE9YPVF
	 dRacxbuD10rdZYdHQVJGkdAl3iy7NL/TciDUrcDBuwQS0yxCMXzpidCDiLqZn/Xxi8eG7
	 6XNsy6CPPJ3oIzQYiKkpxNDJs21Vs7phMVwTqwUWqc+G3Ve+9JFCFyCWWXybte1f6Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169816;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=CLg0dkhkAHqwvH4NqaW3nQ9pKyM6DLsfJFXhxQWDQ00=;
	b=18QRfh3aKmleUcrhn3cC0/uXYLFr4M9KiMudODzZSDM23L0CsciR1UExj3UOaZMazoOZ
	 4bbFm5SGhp2ydqpj1lINL1E6bZM+lmoTVsEbeoSCcOPh/An45AG0ZSO49WfDsQd0BfijZ
	 to5lqpeoMiZzqJHKmWT22ge9sO1CVCQlRVtmWHnWU+/EwiJJS8SdQWNcgrOxWRIvXRGhv
	 br5xUWYUKy7ggg1k+EG2oFaOzHP4sjSed2uZH3lKr7TSNK8TI99xwqtQIVesrObEvk3Ui
	 ykTfpgQTDdf+0YY+v+8jJB9LgNc3CAIN5CIHu6EKimbfpEgYWEte4u7E20vIaMF0a+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=i4poTfs6;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563E3606D80F
	for <imx@lists.linux.dev>; Sun,  8 Nov 2026 20:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563E3606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=i4poTfs6
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 39EDFD4223;
	Sun,  8 Nov 2026 22:30:11 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 39EDFD4223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1794169813;
	bh=CLg0dkhkAHqwvH4NqaW3nQ9pKyM6DLsfJFXhxQWDQ00=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=i4poTfs6sLriei2b8QRGHlw6KjyTG6NLgwR+p3tAfmpwrNOONvb8J77ZkXxCA8CL3
	 sYO03+q9Hfzuaklw4QWATFZIvjr3StGH5Q50CzVOxzMFbF0jO25m27QiCyuq5QTiIo
	 DqnkQrOGyVI1Bh0WsAi9HAeCarhrfENIHg+m9apQdrXKKbA7pl5nkE23uIBulrv2lA
	 M0XEpsFyWZgq+lAOtg0C7elFUGWh0nYDdws+3END/2OoNC/BZiN+1OQIA2qLVKFMxW
	 SK25IMV8g6j2S6yZAWzU2V7ckPD/GigjTvfcIwYUU3nav3gxA33A7iWEKuRj9KId9k
	 ChTKFNl9KelFw==
Message-ID: <912bdd213166ff7d6c24580896b92bb0a3edea78.camel@rendec.net>
Subject: Re: [PATCH v7 10/10] irqchip/imx-irqsteer: Use
 devm_irq_domain_create_linear()
From: Radu Rendec <radu@rendec.net>
To: Zhipeng.wang_1@oss.nxp.com, Thomas Gleixner <tglx@kernel.org>, Marc
 Zyngier	 <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Fabio Estevam	
 <festevam@nabladev.com>, Jindong Yue <jindong.yue@nxp.com>,
 xuegang.liu@nxp.com, 	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Sun, 08 Nov 2026 15:30:09 -0500
In-Reply-To: <20261104073759.386777-11-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
	 <20261104073759.386777-11-Zhipeng.wang_1@oss.nxp.com>
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

On Wed, 2026-11-04 at 16:37 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>=20
> Replace irq_domain_create_linear() with the new
> devm_irq_domain_create_linear() helper, so the IRQ domain is released
> automatically on unbind and remove() no longer has to call
> irq_domain_remove(). No functional change.
>=20
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
> =C2=A01 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index d15b806b278c..da6e8d1bbec1 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -248,8 +248,9 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), data-=
>reg_num * 32,
> -						&imx_irqsteer_domain_ops, data);
> +	data->domain =3D devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&=
pdev->dev),
> +						=C2=A0=C2=A0=C2=A0=C2=A0 data->reg_num * 32,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 &imx_irqsteer_domain_ops, data);
> =C2=A0	if (!data->domain) {
> =C2=A0		dev_err(&pdev->dev, "failed to create IRQ domain\n");
> =C2=A0		return -ENOMEM;
> @@ -298,8 +299,6 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
> =C2=A0	for (hwirq =3D 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
> =C2=A0		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain, hwirq=
));
> =C2=A0
> -	irq_domain_remove(irqsteer_data->domain);
> -
> =C2=A0	if (ret >=3D 0)
> =C2=A0		pm_runtime_put_noidle(&pdev->dev);
> =C2=A0}

Reviewed-by: Radu Rendec <radu@rendec.net>
