Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498648;
	b=K9RO/cud26xOAk6uWn4iYkC5QaQDLBJnLwVZ6JgTs+meroaqnzpRdc56VVrdU3y5pP3W
	 wxWceD+ikTM/fLmCOI2YmGojsrTNdjAHShgNBSuhzB04DT6MTKiT3R4mlFRRG+4MyKr38
	 3MQbcnYHc3ENRWeztqdMCjWiO7ZLeNcJjLpUSYMcoDpgGugCIVJt2kdtJdGJ525RNk6mj
	 jFEhFBtEoxeBoEsnIVyQ4Sroqyfmmg+FY7mqjp3Pbq4CrAsBLKHfet9flz5r63zaFrFrL
	 28oh0ADioWkgxitngdkiyN7jMBMdS/15B5ZpoH7LVXQmtlXKGzBcn8HE7gN87STE2Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5aErT2kLIK2X/FxAJIiabzmuR8QnG936yvowVUxXauc=;
	b=fPA63cAK+7RJzC53Hl9YCJoNJRlT9zIC5uQ7umVAzq9BGF1Pk3ZCjNdhI++UPEYMs28Q
	 +muZ+i8jxiwq2hRCy0vWqpFm+reftilGszqJHtJkBWwcqn4BCAxYdMZkuYf/4oX+27Vp5
	 wcuWSTF6xZf7nLvq+7X1Hv2QickNfXM/TBqTcExVwM8+R0YZYKIuavCTQqGSKUypTU7p+
	 0qwaxkF2AHaWUnPvZK9tMwDCVo96q/rIKvwMFjbhFjO0sYiMCExRh/qril6nUjFsGaEj0
	 +2l2oVuXhsReKx7ZkxPjn1o9OHbRXYt9tVRFWRgJODYMI934M8MWGDHYVfE9F0XWmEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JHejZ3cn;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53622606A321
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 05:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53622606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JHejZ3cn
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a210470b49so39480905e9.2
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 21:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795498646; x=1796103446; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5aErT2kLIK2X/FxAJIiabzmuR8QnG936yvowVUxXauc=;
        b=JHejZ3cnrCqSvKjh78RsU4o+Zyd3v30zhrYeqZzKvF60Mbvcu7STpLniEZM5bF9kOf
         rq2DKUqgsRp6aDoFT4jnEjn9z7Qh6gxw6eG3bpnzGPj8ciTF22YrUYxGnE4DR9Am286r
         xV5qMFeTpKftFka3r5zk3ZtGmoBViXhp1XBIbYpU07K7SyL6lltpgBk3Sf9SBKsdU0lm
         K/ZhvJknwWlhTdlIWQUgkUv/FEbQsDesixg6GFO4/1t4ekKQ9RYNmfuQ0AmhM+BJXYWc
         ilynMqvNt/cQmCHoQpvXEPv5v7HNph3ZEXq/3//i1mPWdyozigyxdHIIU3Svqr8tw8Qh
         91NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498646; x=1796103446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5aErT2kLIK2X/FxAJIiabzmuR8QnG936yvowVUxXauc=;
        b=ybcuym5pStxKkNQR7XeOoe8Q3iIys2cKP5C35roIntHFmD1puomZTO4PhNpKJ3cEre
         SlYBtrOT4HvNAo9ENbeVfYWQLU+rrn+swgPw5Ovlyn8Ik5BkN+36WPWKtqdyd5bhVqeZ
         NA4jq2pvAEfyxWQz2ZV0O7X2As9xADkd0xqWMc2qmp2fMGN/3VE13ldjsyO6WA3bRJ8J
         43Kg87svNWWq2ySq8V1tJcncWAr7xXeIfmCepiJKvE98ACvQKvRjrF9etqr+dTx8HKkE
         mcjh9hu2pje0F5CuZgqEEzYYHXAwf9Moi8KdvSzLLYBJ+yLtRNj9stS8LUWNNXaF7yAZ
         p+Tg==
X-Forwarded-Encrypted: i=1; AL+hErFQCSDmbHjMNkvuyLohDZCTJZ6WRYq9AVy/6IzKVuV+XH7f27cgHjdidx/bUfRRAiP9ZcE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8BAOXoHmqLz4f19xKmQdkWOi12O5ZTPkrJCGAg+y6jhN0hTEpf
	Bnd8/wq4dAw63HS1PfpPrBIjFFtF90PxNtl2tVIiFrB3hkyr1tAwZfM6
X-Gm-Gg: AZFdTZdmWATpMthgGkPxxNIhPQEa2v4pdUy4iKBMkCMEkSLTfP4NkyW1sgEUPdUjP9J
	v0kePXB9yd0esD7WqxT698V+2b70rG7n8hz2tUXYHlsq/sflrMGHOAvBTmSlgUEoubkcjKB8YUf
	JqYmHhFAL36pYn6bHgqLZ59D2YMiKfiJ6jEAS4MxnD02f3BHB4M47tz0P90nRP+imkb9Nt0RxNK
	pJuHMc1Zov01kUfR/RkMyGKGyy9hygM2SeQZMnp9Nt4Ou08JdEC5GOj1kNJF3SvN3dhKONq8LSq
	AVL2Zot+9gchx/NrVBrwVQJC/8LM4i5iHciP7V66luOHv+FH36sfcEL7PPH0xwqlALRRVlzOv1h
	fbNHLktFndZB8LeScPl8uluiQ2vENbCrRQA1BlwWsXjC6ImYK+BsLZMtupzA5aEEXrYgnDHWbcO
	idBGSaJlj6tU9KkI28N92XnMiqXf4nRsSldeGeCM8iBur/hoDsDrCwazH1bbixOxDkdzLvPflFA
	3PmuQM+DCJQzJV+wVa42Yzd8jfNcwXa4nmvn6CYZCeUgF7bxvTqoSglmU9aoglRtK32jhPW0b/G
	iX52uwosQVxUJj51f8o9b7CSD+AGFFkHTIx+hv4XgdAoIqMZ89m4nPuOeZDI7tZsBPoGD6YGws4
	4mzhgJQAS/Kj5b2aSk4Ic1VOO89B4QsOqk1eo2UulRbsVci9bmeMmatLQGfH3MmkOcfg=
X-Received: by 2002:a05:600c:4e43:b0:4bb:5bf3:8ee9 with SMTP id 5b1f17b1804b1-4bb8893c2d4mr277734055e9.31.1795498646496;
        Mon, 23 Nov 2026 21:37:26 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm323959585e9.0.2026.11.23.21.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:37:25 -0800 (PST)
Date: Tue, 24 Nov 2026 08:37:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jiaqi Shi <shijiaqi_develop@163.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-staging@lists.linux.dev, slongerbeam@gmail.com,
	p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, kernel@pengutronix.de,
	festevam@gmail.com
Subject: Re: [PATCH v6 0/2] media: imx: staging cleanup and FIM export to
 v4l2-core
Message-ID: <awUika9V8utfgFXc@stanley.mountain>
References: <20261122114205.494704-1-shijiaqi_develop@163.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122114205.494704-1-shijiaqi_develop@163.com>

Please wait 24 hours between resends...

regards,
dan carpenter

