Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C119B3FBEC5;
	Thu, 30 Apr 2026 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777537213; cv=none; b=Yb4a64iQIn1iX4CXlCZ985RIqD8daj2tLWzg62FyUV0QQSjH6/DiYMj4GKSd1rranWb1o5bGM4N8FxaBrX89nSzegP9FRbkjfc6KZlQI98GVDtsAyPQf7qvXVdZxrwnT6F+R87zpbYkb0G4msXsFnvikdmQPW6cAZMK9GoGuddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777537213; c=relaxed/simple;
	bh=CvZdTuDsOPbOOmFVZSdMX9Q+/W011Sk793y54eFmV0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/KYHkB11dsSb42Njooe6bmnRg5LsTD5yO2ZDwVOSjWGbfC5a1us2fBxfblqmvFJD+eTCxmApjtoVPHH7eM9C2pmIwQM25IuwegdiaA0kImwotFbKe2qyNM8echn8k44CHH+PCNWPENVtTfqf2Dsfkc7DjHz2kX6FOocyPmqh7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XaUMvcwj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XaUMvcwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777537207;
	bh=CvZdTuDsOPbOOmFVZSdMX9Q+/W011Sk793y54eFmV0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XaUMvcwjVufXn463hhg7uWcS9Rxv4Tru74bsB2yGvC44ZNYhwnpiLzll7Gb+tm6TG
	 UqehcY/XL/b/r6ZKGeKJhciwp1yH/flVzYSRMTNzCW72taUSt8Ki6JokO9N1XqkCRN
	 IW4WwECF47QGtHp5iU8wk8GOtZM/wUr+4lw6vHxj6KV9Euxytw/N3w5tdQZMlZXsC1
	 Wv7Af0VSwdITetenf94ZVMVV0uqFFNpWhr3WCvdNDPXW8QKz2HpHfWl9sQjCZA3EOl
	 jrDBSBPkekD7cfEF1pN3iXYFUYu0w9AVubP0oSDTUOA2sgKL9/QOviFMqGwZGvcadX
	 zDOilydgE2mQw==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7176017E1340;
	Thu, 30 Apr 2026 10:20:06 +0200 (CEST)
Message-ID: <6ff04d04-ebe8-4a57-bdc2-b98346080055@collabora.com>
Date: Thu, 30 Apr 2026 10:20:06 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: verisilicon: Simplify motion vectors and
 rfc buffers allocation
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Frank Li <Frank.li@nxp.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, heiko@sntech.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 kernel@collabora.com
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
 <20260415140420.282084-2-benjamin.gaignard@collabora.com>
 <aeIRWW937ev_F8zF@lizhi-Precision-Tower-5810>
 <4064d0168c3409a1e15f9c92da56cea93956b31e.camel@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <4064d0168c3409a1e15f9c92da56cea93956b31e.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 29/04/2026 à 20:11, Nicolas Dufresne a écrit :
> Hi Benjamin,
>
> Le vendredi 17 avril 2026 à 06:54 -0400, Frank Li a écrit :
>> On Wed, Apr 15, 2026 at 04:04:19PM +0200, Benjamin Gaignard wrote:
>>> Until now we reserve the space needed for motion vectors and reference
>>> frame compression at the end of the frame buffer.
>>> Disentanglement mv and rfc from frame buffers by allocating
>>> distinct buffers for each purpose.
>>> That simplify the code by removing lot of offset computation.
>> Can you try split to more small and straight forward patches, for example
>>
>> for example create patch just move hantro_h264_mv_size() to header file,
> Marking this has Change Requested, as I completely agree with Frank that a split
> of this giant will help proper review.

I will cut the series in two: one clean up series (which will come after av1 lib series been merged)
and buffer simplification patch after that.

Benjamin

>
> Nicolas
>
>> ...
>>> +++ b/drivers/media/platform/verisilicon/hantro_hevc.c
>>> @@ -44,30 +44,49 @@ dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx,
>>>   	int i;
>>>
>>>   	/* Find the reference buffer in already known ones */
>>> -	for (i = 0;  i < NUM_REF_PICTURES; i++) {
>>> +	for (i = 0; i < NUM_REF_PICTURES; i++) {
>>>   		if (hevc_dec->ref_bufs_poc[i] == poc) {
>>>   			hevc_dec->ref_bufs_used |= 1 << i;
>>>   			return hevc_dec->ref_bufs[i].dma;
>>>   		}
>>>   	}
>>> -
>>>   	return 0;
>> Move this code style change to new patches.
>>
>> Frank
