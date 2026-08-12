Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF9E398915
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534037; cv=none; b=qkWvJmd+UdNFejiLIC3ffvFV9IQz6Zremmd2wnsW9YxvHENx9ZJ+PTS1xMalQHxnGSYhH5v5MQ0KA4ZGulVVItn51FDa7aa8GlvOJHZcBK01uePpbZHY9U2U+7/8MhtcXRgt+RknO1Ffh0PVCeUjowhOmnwHUeHy8IVnJ3z+Bl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534037; c=relaxed/simple;
	bh=9ZhmEmmV+krIFpz/g6z0yC0mNBWXJoMobzASqDpELJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1MM6fAvyzl+gI7M19t1p9oipqkFJvjYB2ktc9d9ZdBWbRz6r4vBNBmK/LG7NalQoFVRdpEEUryegFBayh+En1JKws9+VxXo0Ne3Smqke2TQuB1vIXcXnGHfDb5rooJTRmj+qEb7fZmu1LKqxNZbvy6YiKJ7TeliX9MnIKSVjWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUahSt53; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUahSt53"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so9497925e9.2
        for <imx@lists.linux.dev>; Wed, 12 Aug 2026 04:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534031; x=1787138831; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqVtyUs3B3LjBriNPXaVFL6YD2XVSQF7G6/cSzqiF+I=;
        b=hUahSt53O1/DfM7Y04D7oXr/xYWorA7H1pjCGAgBherbc01ifBB12cMoNj19FFKxGS
         F0FtYDWobRHyhGwYv6fK5kcHKJ2KVSsIstBYp35sFOtp9uxki8n5ASUKbsMSg7O+v5IY
         rTHPRZ5BGpsEjsdRP5ZAX6TSyVq3Zf/wcSgBas3oMiD9qQziMU9c4H70qg9OZRFV7Umb
         hlo777E02of/QzZdcjLY6m7hpjKEEzBGAp16tDJZyC+9ESxaTajHaYG7amdiapldEgJi
         kWXgQLvoK+OJOG5+j6pNd4IJBQAXD6v6O3MTMH/623jfUX/UKdvncGZV/6kOrF9fc9TH
         5WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534031; x=1787138831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqVtyUs3B3LjBriNPXaVFL6YD2XVSQF7G6/cSzqiF+I=;
        b=lWvY+TMe7DNGrfpD/meVvLR/m/wUCpjdMWVTxPW8t+S4iKwUM4Gb5KbkUPtMQ2cBDb
         E2inAJq2vQaNxLlbDVFexL4OvcGJtz4RA8oXU2PKMz3WnJTOJgsglyv4zVLRiVw6cGOo
         LQp0gArBgECWo1FKw4bFSVTFn5IS6ndGasSCfIyNaqLf/eMBmW9QRUe6SNcPTFQYsEy7
         XbLGpoMpvpBlLQm3ycyq5Vh2XynE/nGRYSlowFPPRg6uHEl/eSdiSJw/e3zDurYzI+UZ
         HJ1vWqtekSy449w8F5zHfaPA82Xu4474jAXCRCxcODTFgF4syVT4h64a/w7BDtfSlyBa
         MkRg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+2GFs2B/6QgziaBCU46biATAB4lb128bNM5IbbW7lqqUS/LPHtBEqsAsHWB/xrf0hyiY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8PdvQpOyiRd1GUIcYC8O3bxcStdDs8aiTjs//hDhQq9y+8Smq
	N8czIAKE1W2lA57nrzTpxmTANRWLKHKuxhUV24DIvzB/z2eolWDY+fHr
X-Gm-Gg: AR+sD11CoeODJZVqPL++dLkt6r+5JA+9JnV4PK9k/Vx6bxrEWZmBwv3t26xkbp5Ypbk
	zjQeJpzGExbVvugikfxAp/aTTc0K+WD8DkX9JmxYP475wDsGuGUnlUgjIxKqGx8fz+kBOnMbgkR
	cNW61unT5RzERsD1EfBVXbyJjQV2fSPXNodSSodH8piOXCT95u7GEF45Af/iQaattkJmpwLJqMX
	r2Wnb2mq2qmLIRv8f1jMNyCdlethuaKVFfewjxBLXD8cRYImTj3q69beY+82sZhmODkNLqooPFf
	MAFU7b0pfTdURKb1zGaE8dX5/ACyTQwTWDVCaf656c6paTPRiqF01MfdZM4wRiEzQ3Y0a9lJ5kT
	5w5KDxIPEzr3Gn43KSSxkUFZMNOH8KkgPHWmos28PIPM4Q7Cg8hk/Wcb0P7yEfx6z3LlrSspy62
	SVBogD2LmIlEaSQMb/Ub+jp89KRjQXLY/BmWzyL2vvCzZ4fQCZvxjG3UebVyky2qAlc7PHlwAwj
	3P4fCO5gZrqbmlvuMDXbg==
X-Received: by 2002:a05:600c:468e:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-4997c127e00mr50618625e9.13.1786534030648;
        Wed, 12 Aug 2026 04:27:10 -0700 (PDT)
Received: from [10.25.219.170] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aa3ebe0sm75222995e9.0.2026.08.12.04.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:27:10 -0700 (PDT)
Message-ID: <f4bf1557-9f09-4846-9352-18587cd6e406@gmail.com>
Date: Wed, 12 Aug 2026 04:27:08 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] remoteproc: imx_rpoc: fix carveout name parsing
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta
 <daniel.baluta@oss.nxp.com>, Francesco Dolcini <francesco@dolcini.it>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
 <20260731-sweet-curvy-lion-bf0215@quoll>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260731-sweet-curvy-lion-bf0215@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/31/2026 2:38 AM, Krzysztof Kozlowski wrote:
> On Thu, Jul 30, 2026 at 09:34:10AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The imx remoteproc driver assumes that the names of the reserved memory
>> regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
>> conflicts with the devicetree specification's recommendation, which states
>> that the names of the devicetree nodes should be generic.
> 
> This is not true and I already told you that at v2.
> 
> Best regards,
> Krzysztof
> 

Unintentional. Forgot to update commit message. Sorry for the noise. Will update.

