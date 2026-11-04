Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792624;
	b=foJJzxhXVObGrEfvGO4+/NPm1n44UjBKJe6PLpF10a0E+V3z6kiEwq4i9/CUEZ+4Y9V7
	 dabecgOdd95/TNqDg7emT0Mm1IJTHvN01GVrn0lmGN6ue2vQgCYzPp12o5rcoVu3Kpndg
	 AbYEqn30uPOGxpIrSiJa0Ds/c68GK/eMmolvULIR3OCakwwU0IiSzOpYR2r7RoMDSUgYU
	 iYxrIizCIi61zXLci0koHcSOAoi2YGxaJg7AZSvQg5Ff+r00QSxxDlmB+yA2WbEd44j4C
	 hoLtJgiYSdJDYxOy8YFipvISdrn6ymED5PuEjvNdDDT5+esGH5s5qW+G7P3DtfQEgkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792624;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=z9ysQ+XoG+foncX/3jtWkWh7mLG1px8yz8zNNyKH3rU=;
	b=C59TghHoDHfbHXvUmzSsidrhMB5jFTDnm0W2g/G2m2i4U47sk+fV8x/HqBG7KzhtmwIk
	 QgKnWveVMqnmCghTMrNHQTOZZQwJcbFj+TQIul7UvHjgLzzod2+V4KdDVjNWwKC5Tbu8t
	 O++N8w5ywUifCFFtrCJcxt6kH8Z+mgFjrwqcHpgsLaBQl9XPu7q0VJLCIyBkPQVWTFRAl
	 tc+KR2k7bo1UhcjKWAsvY8aSezfjIPi0KXym0mYdEQcPwNivhnH0bnRzhqIilgXp/b6Fm
	 l1WCadVPvJa22FZ1QKqk1mU9/GIbqvkeCQZDsUtVrAB6KZBYGe7oYh9rpDGyRatY3Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B12606A328
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 11:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B12606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.18] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 833DCA56A2;
	Wed, 04 Nov 2026 12:43:32 +0100 (CET)
Message-ID: <02af8699-0ac3-468c-913e-a374af1c8d63@gpxsee.org>
Date: Wed, 4 Nov 2026 12:43:31 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] media: mgb4: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "open list:DIGITEQ AUTOMOTIVE MGB4 V4L2 DRIVER"
 <linux-media@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <20261103153721.1232488-1-Frank.Li@oss.nxp.com>
 <20261103153721.1232488-2-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <20261103153721.1232488-2-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/26 4:37 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper.
> 
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
>    split to simple patch
> https://lore.kernel.org/imx/38f6a9abf37b06318bb6429ac04807941ca8d558.camel@collabora.com/
> ---
>   drivers/media/pci/mgb4/mgb4_dma.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/mgb4/mgb4_dma.c b/drivers/media/pci/mgb4/mgb4_dma.c
> index cae888e6504b0..c9a15c625be65 100644
> --- a/drivers/media/pci/mgb4/mgb4_dma.c
> +++ b/drivers/media/pci/mgb4/mgb4_dma.c
> @@ -55,8 +55,7 @@ int mgb4_dma_transfer(struct mgb4_dev *mgbdev, u32 channel, bool write,
>   		return -EIO;
>   	}
>   
> -	tx->callback = chan_irq;
> -	tx->callback_param = chan;
> +	dmaengine_desc_set_callback(tx, chan_irq, NULL, chan);
>   
>   	ret = dma_submit_error(dmaengine_submit(tx));
>   	if (ret) {

Acked-by: Martin Tůma <martin.tuma@digiteqautomotive.com>

