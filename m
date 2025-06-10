Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A017233D92
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571662; cv=none; b=DeXHUuTDS8mK3Q0cxh2JG73jyLgr1oObXHyLfCXcz1aefS/vVMCoLXKN/0pamPdJi5R9nGD4vAfK0nEaAPogAv1QZqgLGKUvrzCQ9gTtDebIc+FAFlZZrvPmZ55dlJEm7RhdD5jU8qO8G5Mka3jdDR2EUttXUlvOkpn3cHv9GN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571662; c=relaxed/simple;
	bh=HSn8K1pGrU2ROniCJak99jKwGsLdGfOVBBfXcOPx+xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hy3bPntALiAsAEYmc/uSeIs30Q3ryn3exBs0WcvFwu2Oq/lTt8jG/PooFKCMYI93yjpCrSsjt9fXNxDZn/5rOwATnh84ZdZRYPMVMSMccDHdk35itTxd6GBStGWoZrADoDqy3Tdx44+o/lKJBpSa3G10mlsHdbOZTgHEhzQdmv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRjRR5fZ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRjRR5fZ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-adb4e36904bso1106543566b.1
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 09:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571659; x=1750176459; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSn8K1pGrU2ROniCJak99jKwGsLdGfOVBBfXcOPx+xk=;
        b=iRjRR5fZ7AsNeNpDg4ZH5qG7j84eY18fZJVgc4NauK8fAGVwOHub9gywjodqh5Lz+4
         rLNxcDZM9NMXS+k178dAbEpj2mP9B7HNv5hF/0bZZT6ZE7ohqDhLsa77/+HTKY7yxKsr
         SErlZxznOPOxzKyc+/v6GHDBuJLSbfBY4ieKr5dXvlOdbDqM6w8uVun/Paa986B2J19M
         IaRPYBbce5uePqJWcKGzKvD/bQLesLEgEVamgvQTrilPctYomPFy7zoTakH2t6KZRDJo
         klV/kmwEaBmqOtCOxwgFExSRKpHbN2sxz/hkuunw2plWbPHXV8BDmxxF6BZ7kmOeMd4S
         5IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571659; x=1750176459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSn8K1pGrU2ROniCJak99jKwGsLdGfOVBBfXcOPx+xk=;
        b=pdIn7y/+QASt7TfYas+Ltld5H/MUWYToeimZg3iDWyuaPfkIRk6kXlBL9sCh4irt3B
         9RcLbjLKZ4iQftkC3Rxr5geyom0yadmyItuW8Hj2DxDzRvF6IMVO0TIQJft/JK8539bR
         y2917B0eV+GQ4+TWgfuYzERqkDjDpOolWtbVTGxM9bD8kXBImFDGJ4KRdRpKOjQPaQy4
         rwf9hppoEC2l/PR2/su3H3P6funq/Hy1EIEMny9ZzeSpXp0QHaxFbC3CHFsTypgnf+CQ
         PnHj3owJnCIDBJV3AgX87UnqqvU6Sbl1ANYjN3uH2g1uGex2tpZFU5DIuCE3vUK9xHmK
         FzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtJgrZ0rOMtGa3i3hspLlWqVVPJI+uEq8dvhBJB2ug6CBQxzwAdleGKH9OmHS/1f2z6c0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi4MiKaIxivgx5k4aOwMtVUG5mNkGFvYeFn9S/4dUp4ZSaC7Ou
	mSeMwEvxWfjl0b3pS+zgf2t6MKHg+gyDIZ4PaqpsFDmBXVxG1XWjqBkH
X-Gm-Gg: ASbGncvRjWnDiAja8TKMOSnPZcKUHyqyV5GrPsIG1SWtZSxJRR+7ywYiFsVgrgcDn37
	mIt3ZJnzzVJPQf1Ma5NJ68JLz9wRDdoRY012wxhg7Oq0PBAKGx28r1cBafZuT8Hrxytadj4QEYA
	e4ODAiCoLgucIJQloGqn5ZmFVlFA4rthg8ploMhcl6cLRmAJUSqI5ynObZ2SMSDk2R+N1FBwC1z
	v44EdA2G/uJF6ZEp1G3x8SM/8vC0fqAudymDPKaB3wJvmqSgURFA0HqfaUF8dgJ0M589eC1FE95
	R5RDBW6q3tNh87u06iAe/sg1pMEyGE3W08Y46Ze9eL6l/PY3FIlrO+1wVBdkU4bgIXdN5Ibq+tH
	4YSdFzu4P9nM/7p+d0M1Ib0/Q
X-Google-Smtp-Source: AGHT+IFBP4Ac0eMIqhVrxF6UOvlGCckI5Ip5teFsrW6N1rBQqfQi8L7Td5UuhoSZZjUStG87k5oXlw==
X-Received: by 2002:a17:907:3da3:b0:ad9:db54:ba47 with SMTP id a640c23a62f3a-ade1a9c802emr1697209966b.43.1749571659205;
        Tue, 10 Jun 2025 09:07:39 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60778376e48sm6305308a12.18.2025.06.10.09.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:07:38 -0700 (PDT)
Message-ID: <c346fa54-41f1-4574-abea-a6fb2771bcad@gmail.com>
Date: Tue, 10 Jun 2025 19:07:37 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] bus: add driver for IMX AIPSTZ bridge
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
 <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
 <aD0j3gXeD6Nn6L60@dragon>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aD0j3gXeD6Nn6L60@dragon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/2/2025 7:09 AM, Shawn Guo wrote:
> On Tue, Apr 15, 2025 at 01:19:16PM -0400, Laurentiu Mihalcea wrote:
>> Add driver for this IP. Since there's currently no framework for
>> access controllers (and since there's currently no need for having
>> flexibility w.r.t the configurations) all this driver does is it
>> applies a relaxed, "default" configuration, in which all masters
>> are trusted for R/W.
> Just out of curiosity, is there any ongoing/planned effort about creating
> a framework for access controllers at all?

no plan ATM. Though, I would be interested in knowing if anyone else would benefit
from such an API? I know that STM also has some access controller-related drivers,
but I wonder if STM's drivers and the AIPSTZ are just some isolated cases in which
security-related configuration is done from EL1?
