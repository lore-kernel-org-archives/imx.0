Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2193128BA
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762949655; cv=none; b=gf/0aI1i/xNZxfoLXrQTQT4yLtA+OOCOH77ODuG85ze3SQRTGSmgBvcheZvLxbjUWOXuM8zjjHns/31CvWJq1SMp7wm/gJIv3zc/w1k8jjk9uSc8l1IFUYv6O0aIz1hDS7tXWooi0EQPzSLmBmru7njswRlua0E9781JTFC06cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762949655; c=relaxed/simple;
	bh=7uPcYg2lVHFfpp+yzhBu7ox/Uy6wawl4Hrvj0i9hYfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOrkquJk+0liMIZNSXoCGLvsorJvCAA64fPm8FBZ+3hpDIYUa327mK1+/KXIkD81P7MPsjDP7arXl6ViYTwtjdPDQFjgt6Zh+E/o6Cooquza+3XM0ZVAXfZVTN72WX0Mc4uDt5K3tjt25CDcKY+mLYlj8gXtzEVHHRQckbL92+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LXqlX/cg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LXqlX/cg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477770019e4so8547365e9.3
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 04:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762949652; x=1763554452; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7uPcYg2lVHFfpp+yzhBu7ox/Uy6wawl4Hrvj0i9hYfk=;
        b=LXqlX/cgi399ziySUyjvGJkt4OR0SF9xOah10K0yyr79jxVKoG4A0j7jMA1m1LjZLj
         KIVDzVRVfYuDYnGCF8fzhTmvR6X3q5EtcvJH4LLhN9rKyTFr2gE8fDlz3pGCiOEol8D1
         LnkmOUv17WSvQbIRsbMB1gmTvfnKFmbL7BpeNwI1EjghxqX+x7LC7tirI1CzLUBRvfAw
         NB6Ijda0dw1v6ye4BE35K9H4KmWub8XY63xW+akn46FQSKr0Xdis3Z/pm/39UZCcxpbO
         S3XiGihbFLj70ypnLMuygWitPNWTCuNXa2uyUH7bX22qcX4yNxmv7rOKM5KZeH33zNdU
         y9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762949652; x=1763554452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uPcYg2lVHFfpp+yzhBu7ox/Uy6wawl4Hrvj0i9hYfk=;
        b=cH6m2JFQSrHIO8hPz/OX7kqlXeHX6s3IQh58LMu2xE99vxHT65CuAmRLlN58RAphqt
         3ODEt+lfFAS6JOOyIN8Vd0I0AyKtCSSpBsR/ow7OYzIgq7BsRy0FaFoquHxwUTtBoKPR
         scCjL85XJeL92jebXgRXj/toBtUvYt6n8zN3ouWcnKXqQTa2oUfzwVdfGwIXCX8O9+jC
         EJ29Kx3TzDohETtAyfFZdNLG9Xr11N7fc4BSYWBC0y+7QmUiIFB4gx4Kzu+VoSzhgP6D
         GbhqlwB0ydbkjgWxknvJpfd4MchO4vZe4Zj0k3XwTOJpaceW3BkJe/zlWkWqig33Zinz
         IErQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6+Qs8GRpKLvwqGQg/G/+R55L84v1EBgeGyEynJOZgjIYwalKo3Fn556jPO2DsvjRPlb0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzR53POGEu7j9xrDILnD/lTrpkf0bb7IS2uI4jvY2Jdk7heb/Vn
	NR6zwDkr1IAV36qHTc06SmkFfyxP6oc9Y57yMyjOv/CNwMnVLc/LcgD4KSDa/WZmwCI=
X-Gm-Gg: ASbGncs4BUTVhuSnC727jc+XVWisbCAHQvg1EHevloJUkyrRhPo6db/DqDWfJzDgh9E
	Nd/FTP6t81xEQha0QzmmH247JoMtCKWV77obaP5L+oWW5I5Rb6U2l5S7igmo/NnDjyxMy/JYyEe
	LlNRh5jGoWl3iXecS4Zluq1MMd4hMeSA/g7KUMi7GBQPCS8aGCk0ju1LkTYnlWxRQE5jkBvGcrc
	rDVf+JWN174puF8TsOoptwAxQNd6tJXqpgxCtaPej6eInDCRnsXdnrBuzyEfGbJC1RPlM0a+yed
	/azHn1k7xRVQjNyIVjvuVW4z8zGw0HT7fODaj1Tf/Xj9y3VMi6AD9BINPCIhHZxixPE2UmetU+H
	dGZEbYhYXEPISKvoQpxsWpRThBddt1mEZ+S3n+TD0dAxpgQo6+VpRVz2UqolkB+pf0mLqOkHFrv
	HB4xvpdw==
X-Google-Smtp-Source: AGHT+IHE9gQcKzRZRfVJPwal2CO92YTTNKWhjd3PMe37ZiWw8lo0M7TWEe/XDmM7RYwtcvi4g7le8w==
X-Received: by 2002:a05:600c:3511:b0:477:54cd:2021 with SMTP id 5b1f17b1804b1-47787041346mr27268155e9.8.1762949652523;
        Wed, 12 Nov 2025 04:14:12 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8f3d6sm31531675e9.16.2025.11.12.04.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 04:14:12 -0800 (PST)
Message-ID: <984524c4-e51b-45af-a775-477977df2695@linaro.org>
Date: Wed, 12 Nov 2025 14:14:10 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] mtd: spi-nor: micron-st: add mt35xu01gbba support
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
 <20251112-nor-v4-4-e4637be82a0a@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-nor-v4-4-e4637be82a0a@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Super!
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
