Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171494;
	b=g5Kwzd5jgmMhKHJTUMNbEG8v51/CDhfsST+h0Aj732Gfw9iJHaI51GDCzFRIpRIMY7Rg
	 dHhFd39nv+cs7JX8owaM/SNpJL3sC5QrXs/MTH5vFw3jtDmeeuHGylj9kei9DfW/BVngG
	 daJGFTB6rV4XHWmkYYijYhaY7+KXjGfwzPxKLQj1RGXCW83wtypu429aHtnZutod+Tz2y
	 sDFJpk7XI455IvzTlasLdnxdJ0auil9B9K1EuXERME2EfC6wXQJGdRYbt9bY27HMb3Abv
	 IXvPuKLAsX5Uo1JjN7bYZ89wUihHTAlvrz4nQZRrcoPZJwU3dq6N31hyLpcxY02v3ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1KZ5fR1JPEf3qgwo/H2AXMnVO/Jhwx/3Aw86T6B7Guc=;
	b=BBMC+IHZS6OoBbL+8IQWLoySymq3l6LB19T2eSkNIus1JrC2bwG3JeRb8NxMllYUn2Ho
	 C6YtHZ9fQ3ejY7O6v7Ilhz/AskvcEnx6WZj/F7VQsin+4bf6HRAJGSm5MSTG2ZfpkbGNw
	 DhWN5gHaLaBXV4QEuZG9qYVfDk8sKp43a23LV/engoymFe3NsAQBzBfGLWO1BdAvdy0r5
	 tnHn1cjyIQfizWr/AEdua0IpKRe5MLUScRtH88Q6/+KwR5/ZbOVo9wyXF3RkvJ7iGgNR/
	 NZc0+Ris2LLU2kYM2Dmv3b2NbHNcZszz7AER+7meixKyvN/oeCVxanGdN8eLsNGOrkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rS96z16F;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802A5606A325
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 802A5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rS96z16F
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2efe0e3bdceso3059855ad.2
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 02:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171494; x=1795776294; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1KZ5fR1JPEf3qgwo/H2AXMnVO/Jhwx/3Aw86T6B7Guc=;
        b=rS96z16Fz0HMc1lCaInCTxtsY/dct+uR4C6/uxFns7BM4BYhlpRASgXE5NiEI4itNg
         EStTm73DXYeJneYVkP7Da+r1MlhvmrMtgaqQZH/2ezg3F0adV6Me85T+75cBsQg5/Gti
         Z2PLvF1M8/6ZNZXstxemg+yPUOBWnMRb3QCO7Y7rfdr+Qap6YVwIXzQB+0g6ySvzB3Ir
         D9VHwkYmT5SKbS2aiK/BY1EZkkpCrZ+PSdhW0jw8l8PjvxgyO2qPd+4xopeiZLFrhrlI
         iT9VN5AicvOmOzyOvnaUH6PBU8Id+jEITmdKr1gYzl9pmOtaUvLWJTdhnAV4u0p8cRI3
         /yZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171494; x=1795776294;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KZ5fR1JPEf3qgwo/H2AXMnVO/Jhwx/3Aw86T6B7Guc=;
        b=gKb11HqrQQfnxpQtY5P/oMGi7kaL4MyiUR/4RVKMxzu7W0kSOWUV9w59ivEAN1UJm8
         aKQ52RbbgZlSEJblQoZl6dMcEWpgDGnePQncCbNn1OnesWoQ6y1CbjHgibKT8b0HG0YB
         A+ofILU8WHAWnrgphFRA0Pqx2kcs1dEyxI8NM3i7FGfMlGN6Gn5JLv859OFegQOy3wCi
         PSqus4WKIfMaOZEd85MvA+HCX3Mbx0RR6he4HT9GpgJ0PDW+hUp7ZmhhJRNvGazioVnw
         DHebS5UAj+8RB/ihe7WH4lD8GKzWixFYw79aBZnhJZQQR8AOGXypV6//vCT0z6G+H7eO
         gKvA==
X-Forwarded-Encrypted: i=1; AL+hErF+zqZZo2QJ5NQK9GjXUYtB6GZEs/6QsWkI1+awcw+y18MrPWhIeE2jOiwi01wMbPrhNfI=@lists.linux.dev
X-Gm-Message-State: APuU4Z90eRaXCY8NILXgFk2DkRaq+IxL9nsxpu72+i2pLc1i2zo1BhvE
	aHGh67e4Ahj6IHKFjkCeDIp1y/83Why0qWQFP+c4LrUpoOT4vk17CMTOq4VuAw==
X-Gm-Gg: AZFdTZffl7WVbYQXM3zErr+l6DFNbuyfE8iF1xIw+zawfiWViA+6GBcw9ClwOtHhwA4
	+AtKfQXKEGkNE+GXK2UOfdE/0UJEPBJGtUtgCcM6WoJpxIUyCaKJVh8SY0KFZxSPsuIJrorH2Z8
	OGkVMMdJnty/k274lR9YvgkB37zjG36zDkQSSsV1kBAkU1TibZj4htdJskGeLXdm8opyH7tmSf1
	/iIZYuzvhC5kItw1nFoHWJ2qFBfjE0WQlaLV4Oh8oVyTRlWDx7bZKx//s80rp3rmG5/Q3Q3gvnV
	u0lH7ytsVEjpghJzP8vkpymxhg8/GMl+/DXkQfD8OXkL82yhQq8VOnn6Upbf32ZFHE2YKJlc55n
	cyKQvfOlxAvAwxST7q3VqGSaTMXerOeXpffgHuKB7wYi1Ceb5CN3wboA/YF60kKWwv3E1Xx2WYe
	N3qo7P3u+P/Nmn1wbbalMD189ZkbLcW7Dd1uWxbXUFx1dmW5iYMiZgpEPnRaicRtAe4gkULgHHF
	+o5e9DQaYmV9mVyWJMDhuexFOpY15pcAb1awNG+UIp7Eurjg8QuL0BX7DHFfz5NNywpPsgQnP/9
	HP3rYu5vwvohEkoKVPE2ExJG3C7NzDOoEugyY7t2qOMCV0NV
X-Received: by 2002:a17:902:e847:b0:2ed:3db6:2eb0 with SMTP id d9443c01a7336-2f03f1d63c6mr29795165ad.48.1795171493751;
        Fri, 20 Nov 2026 02:44:53 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1413f3sm12068815ad.68.2026.11.20.02.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:44:53 -0800 (PST)
Message-ID: <14142c89-9e0d-498c-b0e1-08ab6ca56e72@gmail.com>
Date: Fri, 20 Nov 2026 18:44:47 +0800
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
Subject: Re: [PATCH 5/7] arm64: dts: imx95-15x15-evk: Add DMIC codec to
 replace dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-6-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-6-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/2026 11:18 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The "fsl,imx-audio-card" machine driver uses a dummy codec by default
> which does not allow configuring the channel number according to the
> board design. Replace it with a proper "dmic-codec" node configured
> for 2 channels to match the DMIC hardware layout on the i.MX95 15x15
> EVK board.
> 
> Fixes: e3e8b199aff8 ("arm64: dts: imx95: Add imx95-15x15-evk support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu
