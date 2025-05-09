Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB88F290DAD
	for <imx@lists.linux.dev>; Fri,  9 May 2025 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746795293; cv=none; b=oZESY6rbGnXyalD5l9eTBBsuMQoVzaFKk+QozaMoeDQkjAl/wNxmgwtzJjd0qx6g+Qbfw9sn/I5Mdi+HaLU04Hc+93frRz+DMnkAnvmMwgaPcumMk2mZCFjIRuCGSkYmjC8jR1jU/Hcf2bj4Hw+GHwLcOjh6NxRTmY3H7kQvs1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746795293; c=relaxed/simple;
	bh=mdjay/bt0YQTImzRRyNTf7+nM7Iqt5fpIRc4hBQRXqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDWRsP3qi9GezEztZimq+yNWnc+O12xAo4Ox30nQvUpTbd7gw2VmdXF71+zPe72ivQEG5a8cksrNqT0uqfIOYF+GcUVg5et3I//RvF+XKm1I7J6n2tpWMEPyD+6xSpuquAWGnp8g/ibBN61w9b//ZOvEZ1Oay2VJYQlnQo3it8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnFALsp9; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnFALsp9"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54acc0cd458so2166258e87.0
        for <imx@lists.linux.dev>; Fri, 09 May 2025 05:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746795290; x=1747400090; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUkV8BywuFWcK3XlHlfeRzzwdT0Xtem3jQh4BxB4+2M=;
        b=hnFALsp9Cd4119ium+pCK5HbbJfuUsLPOZt5XXwZdSOuZ1mPAS19/fOFS3ctc7nda3
         nYnQV90pKEHFABWdJMOyIg8wzijYGd4zXzVVZfedshHPKfZnnYCM1L4ZOBl3eYIiy3LU
         M2WOE3jSpNHETQgEvuTNTKqbHdo06Z24aKWwjMKaNIuPSSMDBGGiB8jV7LYW42ID39SK
         pNUTPIDinUyMbT0v9MG0ZD5AF0YUSJ867yOwrZQa+vGXv31VTu/peRz5q+geK8pLAVxC
         QC+ggsy5BPmK4IJKl31Jlh4SoCQuVn08trTGXojVLjjdMvlZfXUa3BXF79RO9v5kizM/
         KfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746795290; x=1747400090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUkV8BywuFWcK3XlHlfeRzzwdT0Xtem3jQh4BxB4+2M=;
        b=MdmqtjQXU/vWxoEu9N4ZuFLZgi9f8zuL38IvyS3BqBJfJ/qDCCAPwQoV4XthgG4Auv
         vv5fBTqBpHSxhfAAqbo4RefD9B8kbYsVPvRNYBsOGEue7fbrQBQo9pwIZ9Pf8UhBMxng
         kQwUiIOJZvujIzLtw2S6aRJ5FHkZP3+XbH3EEVZwngoAnfAxucTLcgY8HCzF5CWqZr+a
         q9CCIjCZaQjWs6Lof02xZmY+qjjwpLGTVvz4BW4ZPRrmA6XcM2e+02eup88SulhWdaiL
         dXLNJUaRl1U7U6Nr8ieO3sYAg1izEksVZK7jkSQxKXCxQebYwJBg2r6Qia6qCsOIFSfM
         K4iw==
X-Forwarded-Encrypted: i=1; AJvYcCXS6vWWPkz6I1iXAFq2VEsL071SHhS0P6XXqrwzyEYn0CroxlXs81oG4NpuqrX928zeZ8Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCSua2G72jxneacybRZIo+5cpFpiwmukCI46BN5GTNVMjcWAdc
	ESi9MNL5+iTXMzmWjAJ6Xi/IZ8JF0NhjMwTd9zkOE/Oun1n35msu
X-Gm-Gg: ASbGnctVPB5h48DvakVUDmXt6NT/JdDwG7azkvNEP4hZwtmlU5J5PFNAP6kT4e9uvZ1
	fhbxM/qcZ1XYaR/3Smr5EuW0Q6yBiUuqVQdgqEw+XhbmPGbn97jZp/+BII6IWAbAIPhUpY1qELg
	MabFiyHIuHKu4UdLTl/vLxapR0cyhIAEv6X278mAl+AMyibuI0kvrv0tlAelQIPdPIGaN0rs2b2
	2QyIAqG9tKgaR2NYtjyba5trGIjslgqHbfNENLYhNhcn23MMFb9hsTFbXBGhNVEG5VMpgYVuEa9
	sOn8+NdTjZ5Rag/QU5t2EYTAHUPessGT2ipRRocmG2cmIjeMgvDTFr6W31MvnE2GYkoyWgcEPdW
	nsbKbEOVShzw2VCGGaPtXu68pBm06SB7+
X-Google-Smtp-Source: AGHT+IGB0rBm4Sd2c2ZAuOBq1Wdz7EzM8zgvpzQWNHnTdOFbsdIwxpR9iWs0VxeI4bDlh0fT/50rUQ==
X-Received: by 2002:a05:6512:6506:b0:54f:c074:f91b with SMTP id 2adb3069b0e04-54fc67c95damr1229451e87.24.1746795289472;
        Fri, 09 May 2025 05:54:49 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cdcbsm270564e87.69.2025.05.09.05.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:54:48 -0700 (PDT)
Message-ID: <16e91572-b132-4246-9fa9-8e8bc4c24f40@gmail.com>
Date: Fri, 9 May 2025 15:54:47 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: Add DSPI entries for S32G platforms
To: Krzysztof Kozlowski <krzk@kernel.org>,
 James Clark <james.clark@linaro.org>, Vladimir Oltean <olteanv@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org,
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-14-32bfcd2fea11@linaro.org>
 <3ddde799-76b5-43f9-971e-a52ec322e9b1@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <3ddde799-76b5-43f9-971e-a52ec322e9b1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2025 14:26, Krzysztof Kozlowski wrote:
> On 09/05/2025 13:06, James Clark wrote:
>> +&spi1 {
>> +	pinctrl-0 = <&dspi1_pins>;
>> +	pinctrl-names = "default";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	status = "okay";
>> +
>> +	spidev0: spidev@0 {
> 
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
>> +		compatible = "rohm,dh2228fv";
> 
> 
> Nah, I really doubt. That's not the device you have there. It's
> possible, though, so can you share schematics?

Actually, not even possible. There is no DH2228FV from ROHM. There is 
BH2228FV though:
https://www.rohm.com/products/data-converter/d-a-converters/8bit-d-a/bh2228fv-product

but as you know, it is unlikely this is the part populated on the board.

For the author:
https://lore.kernel.org/linux-rockchip/20250213-calamity-smuggler-5d606993be32@spud/T/

Yours,
	-- Matti
