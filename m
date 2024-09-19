Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C325E198A29
	for <imx@lists.linux.dev>; Thu, 19 Sep 2024 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726733940; cv=none; b=BeGbucXQohU63SIW6vv50cFzJNxAsYSKMKMLhIXVOi4T3EFaCjcqFPgEz1vA2/CjvhMTzkdQctV8g6ZzAte9ZIAjg8UYBJWhWtwG9vw0X7UPz2Z7PnDzP0thI+eu428zi14QrMgZ3K2dti9QqtuAvdf9RYNh5ngP1+EU7ni0N+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726733940; c=relaxed/simple;
	bh=2mNjGAlnjEztP3JS7M9VSET/InivqnEVm9LPkwuS37M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=go0gLN9Bcnw+sj9Usj2VJ+oxEnKexTV0Rt5Gjaf9UbZtvnUaW+KKQdgtAO+NM5W396dA6o7JodooDE6VpF1ddELn+79d1G4mlaGV2MbLt9jZCwiVuJiaWhpkvTjENP9vNaQK7ir0a/O7s3t1gDCNFNm2CnRxwp2XqGiXdi0HqmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EPtebOXg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EPtebOXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726733936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DBR7qTS56Xfn6z8tjqtE1OlYjkoY5xhmr1l/L289+go=;
	b=EPtebOXgvRBrLBgJuArdd0KjlIoUGtddpvbfb88QzdpzosDZB3lnMlmS4hkCbGtsylM2Ta
	2Ok/qCFJWMHAr/rB3jELNZ70E79Alk9CgHkxfunQdaXm/Ir2ZcWAUpXOr8tM89BQfSmnXP
	cJXu7F6MNL0+6PXPDsIv4kZ5XPX1wvo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-Alp4r5lpMgeynpSfXZid4Q-1; Thu, 19 Sep 2024 04:18:55 -0400
X-MC-Unique: Alp4r5lpMgeynpSfXZid4Q-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2f74d4423d2so4135531fa.3
        for <imx@lists.linux.dev>; Thu, 19 Sep 2024 01:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726733934; x=1727338734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DBR7qTS56Xfn6z8tjqtE1OlYjkoY5xhmr1l/L289+go=;
        b=VVxSzoBb1Vjy2JSg8NWluWohQfgDufRuqUuIW6sGKHnL/mofrNjMieDxzYSSSX5DiU
         gNEj7gZW395hF1aumpAl4I4kNHjI2ixLp+lpbbK5vGNRCXHZVuw392vu9vG0cazyGDov
         L/wfMX2FdC9LxhYry387YPvjr8znqba3AGls3jE/PosxI22rMPW4QNxN5BcfCej7OKgu
         FUV7dR0Oz5g0HRVbrRPPB3SlwmnUyQM2btWkVMl07xKsPdslNLCbkrtvytV/XgjBituJ
         fcuFYdS2ncVOwGNu0OJ8VUZ913HPJvNHqB3if1kL03DHHashQQyFGGuKhSFkNvVLuwnB
         nuzA==
X-Forwarded-Encrypted: i=1; AJvYcCV86JemxGkAShDGrMavPiYBo0PLlwYwdLCidm6KKK2yat103hPy+dSe+TdinskyvpI7l4Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCDVe2CG+DYpo9VAJGraOKTr9BEZlnRSi0UEUGSy1iCrnugHf0
	/4krXSBBrd4WkAZ8PDwLgr6zBBc2WcBsvwkcZDwzvyLKlrLLIMyf1p6ACrldN36Mw6nfgZlvMRO
	IwOo1fjhIKAsCs6x7lFIIYpg3LmTKU/FXdqf4FD4sXA9tbUSxPg==
X-Received: by 2002:a2e:742:0:b0:2f7:4c9d:7a87 with SMTP id 38308e7fff4ca-2f7a4b01295mr61967341fa.21.1726733933782;
        Thu, 19 Sep 2024 01:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2MnzbbCEccaeuHDOdq1z+nha8ZSu64dyW4cRwQEWQve8JMuNOlcPjkPasse7ThPGS6D7L0Q==
X-Received: by 2002:a2e:742:0:b0:2f7:4c9d:7a87 with SMTP id 38308e7fff4ca-2f7a4b01295mr61967161fa.21.1726733933280;
        Thu, 19 Sep 2024 01:18:53 -0700 (PDT)
Received: from [192.168.88.100] (146-241-67-136.dyn.eolo.it. [146.241.67.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754c5404sm15336915e9.39.2024.09.19.01.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 01:18:52 -0700 (PDT)
Message-ID: <bc5988ca-4d43-41ce-a5c7-8d4cf67bed71@redhat.com>
Date: Thu, 19 Sep 2024 10:18:50 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] net: fec: Restart PPS after link state change
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>,
 imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
References: <20240916141931.742734-1-csokas.bence@prolan.hu>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240916141931.742734-1-csokas.bence@prolan.hu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/16/24 16:19, Csókás, Bence wrote:
> On link state change, the controller gets reset,
> causing PPS to drop out. Re-enable PPS if it was
> enabled before the controller reset.
> 
> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>

This and the next patch look like a bugfix, as such they should target 
the 'net' tree:

https://elixir.bootlin.com/linux/v6.11/source/Documentation/process/maintainer-netdev.rst#L64

and you should include suitable fixes tag in each of them.

Thanks,

Paolo

