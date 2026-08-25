Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79422472F9B
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668073; cv=none; b=gpIKbrS2fkTXGdFcB+ZKA/QjdwAPqYdzswDFEF2jqUy04FxC0z8N+QiK/7J5tK47ja5SFGvgyhYXvIu3QrZTF0S7jRvbKOUbVwpQXS3Wcl5JZmpRS6jZTwnCOD8pqbKVBAlE+BbAgpHp8+6SKtmHmPPpf3EiTP9OmIzjdxko9JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668073; c=relaxed/simple;
	bh=c14LTKVn/O+SD5dIrbx+m2krVr4yntD1oc8eOnadNhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KL08R65o/1P2wzIz8hx5hxtAUTpLzCoXBWH5szOJpgEt0DhZzm6o/NiyOcYCdH7400fgkshoVBJDw/fyo6igB+VjdxCtQRnlTzAgKf55KQspGXyqf4Y8sDH60i/AcwtSmNhkbRl4/wMcYiYMDMO2RKaLfdscv/UOxZTFD5bYjSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=RVZiZTK8; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="RVZiZTK8"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E630011CBD8;
	Tue, 25 Aug 2026 16:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787668066;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=uWhyRdiLypYwpArqGPH+yKWAtG1EpOJWaXlhuo5dMxY=;
	b=RVZiZTK8AiD5RgM6owxqimtLH1nj+2uWsrafgD5D2/mXYoa0qL84IH3ot3ppJ0hi3Z3R5c
	62PFxBqUCThL3JpUPDwUd2LgVnhoGqeHepS/OUTSlWMiUQkG9/hZFtQCGEKFV2/FShB7YG
	yziToelIOHiZaZL2CXcYh8/NuWgZEM7+gik6sdBrViFAYqYVsLj7XTUQmWtZz6V6tCnHD7
	gVXOpUF2NH3iDoF/5iGvhTDmcVuIDpGvDd6uxhSoQbCriHcnxx3Ij4tlAhElIAomew16aQ
	fuu9oz4qDxsEX4tv7353Gef/wP1guc2KHQ4JAqg9oIQTPSwI5Bt/b8y3mDdBKQ==
Message-ID: <df32f637-486c-4164-a8bf-149d3120b83d@nabladev.com>
Date: Tue, 25 Aug 2026 16:27:45 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard configuration
 EEPROM layout DTOs
To: Frank Li <Frank.li@oss.nxp.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org,
 Frank.Li@kernel.org, devicetree@vger.kernel.org
References: <20260825135754.864501-1-marex@nabladev.com>
 <20260825140251.28B981F00A3A@smtp.kernel.org> <ao2kBe5NFvvwY4ow@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <ao2kBe5NFvvwY4ow@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/25/26 4:17 PM, Frank Li wrote:

Hello Frank,

>> Is there a typo in this node name? It appears to be missing a 'p' and should
>> perhaps be software-compatibility@84.
> 
> Please fix it
Fixed in V2, thanks.
