Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BE84C91
	for <imx@lists.linux.dev>; Tue, 12 Nov 2024 07:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731394885; cv=none; b=BLY8M3qoJp65nJ512mRIRA/v+X8fMMkom8VdyW7ZSCwLG2SD2uX2Z6Z/K2ylsZbINnFlDAOHdqyvUUJhuP/5TpuCxF9An0PZTIF+34paXN8qv5oHIRQmKspdcQwIEiHt9N77bjZibJTqjjG+FsLEW9uF3NdlZjnUSIYbINKxk5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731394885; c=relaxed/simple;
	bh=1Uzacw4ZWXaBfsEOBKezW2Dbt7/ir/lJdgwfmk4QUAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JSS22tilQ//alkDiFrqzLTTXaB8o1iCiYZiicPnI/2vlramHtdrs4B9Ah+uPwuUIjW8H+puMANDNPOMYhXCEGlWGmnzVMoIc/vlP6bCvXbNDse1a0NC9bxPFIcn189aIaEoVQQdVTpi7kB/wVsvLIIzgHC6cpYn72URZMd5Xis4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PEAw8SgQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PEAw8SgQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so3522979f8f.3
        for <imx@lists.linux.dev>; Mon, 11 Nov 2024 23:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731394882; x=1731999682; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e90Eas/uN+CMCjttr3SXpKE5ydwUVfeG05npd83rlog=;
        b=PEAw8SgQt4uWY8qydDApYjW/1APuwctW965BicXRiib8E+1rcjAZZb6gSsLYmvr7YR
         pMhHAcYp/Qu1mUWlZu0UbkV3qM+vlOWz0L4pL0zxqnCjXBBikp7lEI53OGzeU+HkF+Pf
         WlhN5wld7EmV+Ov6Vj1oYlmtV6EpsZ9lBBuANdqA2qC/XHusIccN3Y1cstLnTmlypQyZ
         kWv1XADjShRuQ6+Q6yugazW89niCfqIRVY3dfkhBZ7jamDMK8vW+fFVLxO175rJuxxag
         gXpbEnkXlTUwb/XNOYFCbHzNcIAAKyMMcL/mG5IxMsxvxAwx6hrRWAHr1Wph/js7JEKu
         rsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731394882; x=1731999682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e90Eas/uN+CMCjttr3SXpKE5ydwUVfeG05npd83rlog=;
        b=dxBYqV+Kmyok4DcxvRC9EfQ7bQgsSYDdlZW2GEaWt1GIpDlcebhya0PmkQ4HLc2I4J
         kv9dwoHJ5GFV5vq5/ZsE+6PpWLKmJ9F9zYxnDyyXofbnhGtf22zxc+h+A66LBBZVRWlI
         2vjlcf9hg6GXWwp3doJHB9m1bMPi+w/1ftEQwOeZBJR9lUWItlv2nRhDLxlzMtC9NjYJ
         nG5ubhJEu2Fu1HCxGpClbmapVvPixqZhoMb9UPsIygodz3hqwCX7BEDsqZDeikMM9XI+
         pzQP+IvfuXYd5qJZfarUMXX4d/izLZy7/PeyfUUA9wDPs61b0Wit+yrYAzvdVJpVeTfr
         S07w==
X-Forwarded-Encrypted: i=1; AJvYcCVDM7eShW630SProTZoYAa1nT+25bM98Kg5sSNpAiZ6mFu/B99M8aDZ9CAFT1UtSrjJacQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMVrhLHTfbrdBNbLfxbWyZv/yi2TWtIv5UfIlYMmlrvzZt3xvA
	YBo2EodumG64kifnDXd+TODOB2eFk16ycpfq+QLbpoXhqeCsiHJlp984jZ4yo7o=
X-Google-Smtp-Source: AGHT+IGzjqCewg7v6LJsuluGeAw1t5n9E9T4ICaCzkpdT98/eoBBrmLzKDxDD8P1qsH+agtyBhgBiQ==
X-Received: by 2002:a05:6000:1ace:b0:37c:d11f:c591 with SMTP id ffacd0b85a97d-381f172a8d1mr13824302f8f.17.1731394882338;
        Mon, 11 Nov 2024 23:01:22 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9f8dfbsm14807593f8f.73.2024.11.11.23.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 23:01:21 -0800 (PST)
Message-ID: <7d5dcd4e-967c-4627-92d5-86232492c7e3@linaro.org>
Date: Tue, 12 Nov 2024 07:01:19 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 2/2] mtd: spi-nor: support vcc-supply regulator
To: Pratyush Yadav <pratyush@kernel.org>
Cc: peng.fan@oss.nxp.com, m.felsch@pengutronix.de, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
References: <20241029102238.44673-1-tudor.ambarus@linaro.org>
 <20241029102238.44673-2-tudor.ambarus@linaro.org>
 <mafs0zfm57tsy.fsf@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs0zfm57tsy.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/24 2:02 PM, Pratyush Yadav wrote:
> On Tue, Oct 29 2024, Tudor Ambarus wrote:
> 
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> SPI NOR flashes needs power supply to work properly. The power supply
>> maybe software controllable per board design. So add the support
>> for an vcc-supply regulator.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
>> [ta: move devm_regulator_get_enable() to spi_nor_probe(). Add local dev
>> variable to avoid dereferences.]
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> 

thanks, Pratyush. I sent a v5 here, where I introduce the temporary
variable to struct device in its dedicated patch. Would you mind adding
the R-b tag there?
https://lore.kernel.org/linux-mtd/20241111111946.9048-1-tudor.ambarus@linaro.org/

btw, I try to keep patchwork in sync, so you can see the status of
patches there as well:

https://patchwork.ozlabs.org/project/linux-mtd/list/?series=&submitter=&state=&q=spi-nor&archive=&delegate=

Thanks!
