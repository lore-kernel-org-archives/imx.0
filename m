Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0805F1A38F9
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 21:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786398880; cv=none; b=tIfYAYuT+EORUKGvx+sIcFyDKEkJ7Lf2P1wegEGRzlOMFoHvWHdeVkSuRYo7ILifEQS5vUyS/UKXc5HierotUf+UF+XF8uWxvI+rKglhpQJ6ZXhbQLXPe7l3nga63jzM9UYpi7jeW0Y9mHJVaFYzLUG+16V0/3sMsBKmyO1xqJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786398880; c=relaxed/simple;
	bh=SCBzgrxKtqazB9yEyvdjBsjeh/HSMd/mJ5u/NXQxFEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdHMJA7fAAEeqh5kqHUZp5br99GBbwLyuXmOz/Uk0mHurXXTVR3I3P8+UFs6EDcaUKPg4IQAh0c3LmPthIH7hhlNMIBLig7KkkOmc1SWygCrgw1PJBNeAjBmPlQwDSFY3/tS8X49JAHl5y6kRMSc0sovhWhGWninpEyK5MN7qEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=K/GW74Ru; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="K/GW74Ru"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33E7B118B78;
	Mon, 10 Aug 2026 23:54:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786398871;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=s2aXjqlZJY2XwQyr2ijzNBco1TPxhbOhA17EK33gL+8=;
	b=K/GW74Ru5ot9a3m/bT05DxW85NNDE0yfURz2sZc0MKygnSX81Ci0BzePTxVcRO7ASJGtNU
	gdunC+TNEmo2SYi2/HBp0XDdaAq1B+yLSosDTcFCKtiQGb/PY/cBFm6O6z80dyny0zaRId
	w7ibNbzQqOLRmwKg4ixkeWnmmYNOkfL4BdimDjZ3l3w7VstBmCfLGx5LElVNBqIWy6Mg/6
	wVx/+Sv0bZBAjGAM/UWGO+iIGfk5m+YkZsPZq4U/n5Gg6cp8/6aH7snmFlN4JedH0SObxe
	mNqIa0+QP6zmTw7qhkq96QjdHAghr5+cuca2H07y/h/vooh631qhsCDxld5aWg==
Message-ID: <c5bcaa73-97d2-465c-b6cf-aea3e339d7f3@nabladev.com>
Date: Mon, 10 Aug 2026 23:54:28 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: Select HAVE_SHARED_GPIOS for ARCH_MXC
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <brgl@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Fedor Ross <fedor.ross@ifm.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Rutland
 <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260810213456.1268831-1-marex@nabladev.com>
 <anpGRPJwQbt6UMZx@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <anpGRPJwQbt6UMZx@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/10/26 11:44 PM, Frank Li wrote:
> On Mon, Aug 10, 2026 at 11:34:38PM +0200, Marek Vasut wrote:
>> Some NXP i.MX platforms use shared GPIOs. Enable support for them by
>> selecting the Kconfig switch provided by GPIOLIB.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
> 
> Haibo have similar patch
> https://lore.kernel.org/imx/20260730-can-share-silent-v1-2-63fd603f943d@nxp.com/
> 
> But I hope the SoC maintainer provide review/ack-by tags
This patch keeps the list of select-ed Kconfig symbols sorted, the one 
from Haibo does not. But with that fixed, the patches are equivalent.
