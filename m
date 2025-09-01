Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9A62FFDD2
	for <imx@lists.linux.dev>; Mon,  1 Sep 2025 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717824; cv=none; b=dbXw4ayXvwzcFVqKtURpHvgcQ+3K9nBSFbvzOTBqCk3e+n9e1v0LSqknrh6q7/nOQv3FjStLxCn2iyBuqFnykZIMdq5xZ9d/UjSB9KbDreRYvu/81cF3xLHbxH27BBujPNVTWZSaAfqyHIZ+m9knEcP4tnnK3hNwlzDGuwMSpG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717824; c=relaxed/simple;
	bh=wHuP9vzcf0uxMcxpVzhAD7blzq8KbpGGUt0A4O2FaOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxFyn2PM9ELg6OtVcd7qVlAdfFG3sz5BSLmO0kfxKXxPNYR+OyJFvEjWW/bNy7HgDxccsIJJGSLMvNUVgoTMWye1cNh0aLmbYFCBvqqSlq4tbVjK2nUSv/5ZhBH6LVYbnpkWJJtM4q7DJ95X4jvVWvwPaJijyQtPemNKlbVbsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j9HB4397; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j9HB4397"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ce4ed7a73fso2010677f8f.1
        for <imx@lists.linux.dev>; Mon, 01 Sep 2025 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756717821; x=1757322621; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=meHf9Dzi9Udu3DdPaq0IFaV1tFMGI7amWp2ppks2KVU=;
        b=j9HB43978E7Fk6fC4oqWK//WlkSxhxv5IKDkJ1w46IHWX4czzAiOFPDw7dzBRAX4cW
         VbfM0ybxBNQ4pura/Yty1dRIMxjV3+KGQ6qdH27pWrLKPT4HYCP/1z5O6sVDv6jO3tq8
         oaa/tXT9DaiykGz5Ev3tcIayZpBpxxrtd+1HvdBVdOmoh/GrY2AowPuY5Ul2qq9kppHY
         LLAqpbd5Y9uhhPmy3B7XU8Ikk/h1Q/mNu8xzeSuqICJ7FCEvU/izciq8jbGLhUDnRn4s
         NAQX3/Hm38fMfSb7mtSio0KiiLFNCIAbVy1PqCScOMKtXWUbWiolhBa7UwdIAKYYiwm0
         dltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717821; x=1757322621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=meHf9Dzi9Udu3DdPaq0IFaV1tFMGI7amWp2ppks2KVU=;
        b=DJmFhlsQ38L84BWng8+tBn8hvWPvSvooytMNrgyx8fFHl0soaQKI0zy3efIh+2O6K4
         7EaQpZu/Y/UzJk1anGbS/uosYE0qcXA1WMpiI/FYti3BxiLB0DhamilhfwE2suEmmc8o
         6DEEF6LZU/eXrkylZB0+ldEO/WZ9AHxTdzYHGELSIVUxxXHL8KC7NpgL0PY1Ghrf6d3D
         KkWmd9ny0gTrlrtGHP53yB4yAOYEFhS2yDQa3Q8CQoYY5G+47xp4zodR5PDIWDdTpWyK
         go+fP6E/REdB4XeE5dJTA/UHofFQ0vcPPIWjguDSspk1RT+d3w6smyWeBwJMSjqNmCKG
         6dnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfSuDB0nQUHnAS4mirH4X6U0bK9hXOCvEP9WPLkdnuyeq4BlRcOqmsd2Td9SeGYw8LC3M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfAugvz1dk91IJzgFihcy6Ht/NOcFs7QEUuJKffjsQ2d4T/UMq
	3L6geb6QDH4I7MCD5/b/66ERGFjfj+mdtnExFyBQDCLdusIJgvMcUxJwbBcCq0k3zVY=
X-Gm-Gg: ASbGnctIXHgbiMJzlCpADtxby3HNu15n6ubfLnLbuzuVivXcjQQh6eYtHEr0NDGryis
	ew1m+iZwnc6r1OdTeV1Fu4rHiIYd2kWQqwIwS5IlMEO7Z3Y+RrqwhIX0UQt/4gw5vO86HkkDFW4
	iu9HegR7pW+JYlLw5f8NlBiMktfx5bCThEqsuyAHN/+0zIQlHacIPpWNLetyyQ7PQvgU5SVXN9Y
	1GLHtl6RlP0ggKWLZgh6XLOrn6zUP6wLsNrtz39yCZGdCOh9nMtrV4Hu7gkVY8OQuNEyXBV9Z1G
	hrDIAhgDbbsexVa+opaIaCX10m2j6B1h5sxbndXUP2DIEmybN72qS1lhjvtG1Q9O6cev7gpufXy
	cOEd86vkF7h62QxvTMID5H9Wxz39POCW9ihTZhA==
X-Google-Smtp-Source: AGHT+IHwD9wQkYnnHFPyCoE+oRse9cNjidrfIe1Wag1mwkgXlb86FEc301H4rWNpqC3pM6+30woB+Q==
X-Received: by 2002:a05:6000:2011:b0:3cd:1cc2:f411 with SMTP id ffacd0b85a97d-3d1e0a986c8mr5227063f8f.61.1756717820994;
        Mon, 01 Sep 2025 02:10:20 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d85f80d8casm1010533f8f.54.2025.09.01.02.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:10:20 -0700 (PDT)
Message-ID: <7a40573a-1868-4697-bca5-fb22aac0402e@linaro.org>
Date: Mon, 1 Sep 2025 10:10:19 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] spi: fsl-dspi: Avoid using -EINPROGRESS error code
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>,
 Frank Li <Frank.li@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250829-james-nxp-spi-dma-v5-0-3246957a6ea9@linaro.org>
 <20250829-james-nxp-spi-dma-v5-1-3246957a6ea9@linaro.org>
 <20250829125440.fuxwiekll53myiui@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250829125440.fuxwiekll53myiui@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/08/2025 1:54 pm, Vladimir Oltean wrote:
> On Fri, Aug 29, 2025 at 12:46:43PM +0100, James Clark wrote:
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> The way I'm understanding these tags is: you wrote the patch, I submitted it
> (which is not what is happening).
> 
> I think the conventional way of describing it is:
> 
> Co-developed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Yes I agree, I took your patch a bit too literally and didn't modify it.

