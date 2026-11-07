Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066137;
	b=3Fd02+3e6XXVO3sKrgh8aC0UAcrlGOTdR+3Sxzz4mQnY+OZ0Rf5WbxCr3blX0lh2T8mW
	 qpFAr8lDzDpPJ5g/CgYfCdH3APpNHz9Zc13ZILoMbpXCWrc6LQaGLlKYkq9l/0j8Tixm8
	 /j+8NFOElbJC2+fyegb9nRM3tdR+DlztV4aSLHbw69HYZIrVsPojPph1SVnxYZY4Cdon9
	 oQtzJ83Bx+CnBZIFmn8MPapUECG6fLNGq+tcqy0sFyXlW9287x6ypk3XmvddvJUWy8aVU
	 AL5CAoqOyTTI+Ah3WN3BaEnJX8I9Z4vQ8gR+t7rd9CC5Ag+/aNCezecjmXIkEi3iCzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066137;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=02RmMrYDuqe1ZwKJfkDpL+ozKnlBKLAvKi1f/ZPO+eM=;
	b=4zeb2qcfUA8bR2QBG4HyxgJz67DTbSEGv+Dva0avL6vS6z0q1iKZ3/iiNLCm0qJivmyW
	 T1bIY6eXgVDcJ6kqOuI2V8UbLYBNZBSCqpiMjnms9ecG/LX9GAg02nh8fwx8zB8n0F642
	 K/iNCHwLq/gD/8WbV03NTe7ff/iwe4wHq7qJs12kZ47tmyt1TIIhNaqMbBKWkJVslnArG
	 3ZRv2RE+8ikuTF+0166HSRg7jOhiyhHFnYJl0dqTN8luRnNb5jrrmoakrxZzN484raxMo
	 Aqo4rhUnXYpwinbOMFl9xG2dYuIwQUmeMM5lAgzseNwE5pLW/RhytSA6JXS38AtGS4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUpMjpsv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D992606A326;
	Sat,  7 Nov 2026 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUpMjpsv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45D91F0089F;
	Sat,  7 Nov 2026 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794066137;
	bh=02RmMrYDuqe1ZwKJfkDpL+ozKnlBKLAvKi1f/ZPO+eM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=bUpMjpsvKy6zoWTeJK5ROw+PaPQev2GFzhG3yHzZ+c+NRw5wn4jz8dbWU0DOI7YkU
	 vkDgeuO0hqY9h0Dn7fqZcEwDNmjRHvhRzA8de5jar+Sxa1cpRMt7oQzxRLqJDedr7p
	 yeIvwL56z2nNP8Hu/WREF5NnHya6lMTWjVHF7GO2nGjIfH6IdUrg63Uye6iJdryNVC
	 DbSTG3j6gKfD219c5PM1rTLkm7MeOlouNdbpd72L4o45WTRDx/ptmcDMaeSGqKgevF
	 QnaRIEJWQ+DRS9b2EuHgV+oHHkwORNT7hAi0FXiuYFS+xMABbHvXwdhAZm5/9ksQqy
	 A5la3nD6zn/WQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id D59B02AB3711;
	Sat, 07 Nov 2026 15:42:13 +0000 (GMT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: fsl: imx-card: fix DT node reference leak on
 unbind
From: Mark Brown <broonie@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104024057.1508822-1-vulab@iscas.ac.cn>
References: <20261104024057.1508822-1-vulab@iscas.ac.cn>
Date: Sat, 07 Nov 2026 15:42:12 +0000
Message-Id: <179406613243.3424803.16218252867759690236.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1l5Z1GoGtVhro8Tj5KzjbjIg1LqSe7tU5rSYeviWp0k=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeu139dPVW4MyTcxTnNCwTn2b6qPHrnsR6VStB060lr
 8+JZ65L7ihlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBE8rQZGQ7/SZw2MeB/+t6u
 L0WmJ/pUZy9p1SuSdLxjdmrxZWHfx48Y/peZdad6n+6fez9KZz6b1eXj626Zv74UmVS0apHC1zK
 DuwwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> imx_card_parse_of() takes references on the CPU and codec device nodes
> with snd_soc_of_get_dlc() and snd_soc_of_get_dai_link_codecs() and
> stores them in the link's component arrays. The driver has no remove
> callback and the ASoC core does not drop these references when the card
> is unregistered, so unbinding the platform device or unloading the
> module leaks one device node reference per CPU and codec.

> +static void imx_card_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = dev_get_drvdata(&pdev->dev);
> +	struct snd_soc_dai_link *link;
> +	int i;
> +
> +	for_each_card_prelinks(card, i, link) {
> +		snd_soc_of_put_dai_link_cpus(link);
> +		snd_soc_of_put_dai_link_codecs(link);
> +	}
> +}
> +
>  static const struct of_device_id imx_card_dt_ids[] = {
>  	{ .compatible = "fsl,imx-audio-card", },
>  	{ },
> @@ -940,6 +952,7 @@ static struct platform_driver imx_card_driver = {
>  		.of_match_table = imx_card_dt_ids,
>  	},
>  	.probe = imx_card_probe,
> +	.remove = imx_card_remove,
>  };

This only runs on remove so we've got the same issue if anything goes
wrong during probe (eg, deferral).

-- 
Mark Brown <broonie@kernel.org>
