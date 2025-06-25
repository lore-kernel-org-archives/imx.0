Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58081284B2E
	for <imx@lists.linux.dev>; Wed, 25 Jun 2025 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842046; cv=none; b=TyRTjyDthW3BR4jXL8ZeeQDD0YOYn8nn/X2bDSVNty4BLDO16hCKhOlOBERWk04g655/7EIURRLZ1PHQeFM47Fd0Jry9rYY5WIqYYpEHNen5wFDjBX57Fz42SrUGmWKmqhs+kbBvFMtoKLr+5d/Y/Pck6dhW2x3WBP5RTInPlCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842046; c=relaxed/simple;
	bh=k6H7pwR+nMUj5KnUuh/03FFNHh50oWg7WEJQvNlPz9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9lc37nPPyXxgfhI6KXOyojESlZMPWTDTDG89EBdmtj9u17a/QZINrNpEHdqv9JNcakGGzO2aBGe7z8ryJ5b2UFGNDxaCxgU/H/Y3Qftmpx0mBUK29J+sGyB+TGFy8DLmJ9qjaOOb1zWpBYARNwEUMxc0e77wRyrEC5KpZhEiTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O4xIp4Eh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O4xIp4Eh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so34729105e9.2
        for <imx@lists.linux.dev>; Wed, 25 Jun 2025 02:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750842042; x=1751446842; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ot7b9ErTkUK0Fj2KHvqM8J01nkmxPY1lP+gz/TagS8M=;
        b=O4xIp4Eh5SBUnG1/u0HsTvBt4sz/frM7UWqZtr0mWxJ7Lpb2wWkwSD0ZQ6bRm4Jbzl
         zPc2m1Ii34mw4RDiXsegjKlRg05frJhAT4l+0Rl4w4AzUx0EJYBqC7MbTpOIo4ap799n
         ttjbDZbEt20WGWwrpHLK5wLr5S5JaYXrTLbWieSuUN5oGNWthQ7mbaV5kfb5yJwWHezg
         PbfjFQuJJDts+FI94AmISsB0k/I+kt3Jyr+txulOvaJUFuedqVN+WZvex1KOqSHAYrFs
         ORhhFcmJDFzl0SJUM8W3cNfOuEnLTDZFrX+IHv2PgAGoA0B4GX2sGNt0gQMK1eSfrr5Z
         4stQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842042; x=1751446842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ot7b9ErTkUK0Fj2KHvqM8J01nkmxPY1lP+gz/TagS8M=;
        b=BOcJl9EPYZiIo37XVzHI28xn5Qf0YciZEUXOX1kkCmLUIDaZcxhhnGlyRbC9RMUh7W
         1DO7dAE4mmGqoBNp9aHwZ+1lbsQn3YYs4BNWIfOBsEdiUcOLmQs2yidj/aDc4LHotqiE
         6sAf6woWjp51gErwdNBMtAkZTVnDlNXL4hosqRmwKrjkMIhvaGy0EmLriKt5eYStCOU1
         oZ0VYBhTJZ97sRxArqOYVIRJMEFg1V8Bnk0bYE9BDtxiuTyDIrBbnyjAxsKcV8J9uScI
         C1fcxJcHZ8NjjLlUCoCDXPLi3cWj0R4E2esZNJ36FBt72q/umptPrZd2vnprqbjzFmrQ
         C2mg==
X-Forwarded-Encrypted: i=1; AJvYcCVt1StQG+xFUtVn4A0D+1LXEGCUfoOZ2iyy0iS6U2PsW53/m0x7BlDEduVXOz13TkC+KSg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqwEML4mrFLB52Ey3ajyrXE299WbKE91X0TS9Aa3P44Ly5eXmo
	/UQv6Zztbn9lCddOTerG4cqa96P5KUfYVptjjDmVf5NO/qDQpx6woLf4SYHuw5ibevU=
X-Gm-Gg: ASbGncvQ3dWuZFGmU58jTFJCjykPg3LRca2KHGa507vZcjuNi4C8s8Yiqx0/tfD2Bcy
	acIIPUnkEEFqbM50dJtR97by6AIGoWmVKL5Z0PLhk0ygwKPSxozmysIYypf5Dm4/yNiqmuQ+veW
	xgHACiWFF45xkwNLC3Ge1cBHONXgyqEHZlJsThCF1NxoIOlC+4I+R9Lh8Akugx8i8O8VI4IIz3v
	JEGuvmCbLEQZ1oj3HiAyFic12n5Ir+nsl0sHJF6Afk13YmXgVZo8P3qpicF2zr3gYv8hu/34+on
	XrWOd0Q0Egs+B+oNq/wQmq6enIOfkwp3zjpoDWx5gBhw25E5hGN5DzvVzgfC9mzC75I=
X-Google-Smtp-Source: AGHT+IFqGmOeAo+r0qrrLle282Rq2mdNx8SfBQVv9o5JsGQYYGmqzMjOzIO0MEBF2wayeOF8rShFiQ==
X-Received: by 2002:a05:600c:1d16:b0:453:8042:ba47 with SMTP id 5b1f17b1804b1-45381b0aa8bmr17801875e9.19.1750842042500;
        Wed, 25 Jun 2025 02:00:42 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805d1e2sm3997701f8f.24.2025.06.25.02.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:00:41 -0700 (PDT)
Message-ID: <228fc6f7-52c2-48a8-af7e-6f2cfa7b9168@linaro.org>
Date: Wed, 25 Jun 2025 10:00:41 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-4-e7d574f5f62c@linaro.org>
 <aFrUqW0ijRt7CJzw@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aFrUqW0ijRt7CJzw@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2025 5:39 pm, Frank Li wrote:
> On Tue, Jun 24, 2025 at 11:35:34AM +0100, James Clark wrote:
>> Using coherent memory here isn't functionally necessary. Because the
>> change to use non-coherent memory isn't overly complex and only a few
>> synchronization points are required, we might as well do it while fixing
>> up some other DMA issues.
>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> In https://lore.kernel.org/imx/c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org/
> 
> look like less performance, why need this patch.
> 
> In https://lore.kernel.org/imx/ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org/
> look like better.
> 
> Any conclusion?
> 
> Need performance gain here if it is better.
> 
> Frank
> 

Hi Frank,

The performance figures for this set are in the cover letter. It's 
either the same or faster, there is no evidence of worse performance. 
The one you linked was a bad result from not testing it in DMA mode, but 
it's corrected later in that thread.

The reason the figures aren't in this commit is because it requires this 
change and the one to increase the size of the buffer.

Thanks
James

