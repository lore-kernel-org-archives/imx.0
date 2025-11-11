Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610CA23E33D
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762849427; cv=none; b=kx3KGCePtpq/V2nOLXg8+MBiM5T6lxn16GUXNgxnBYvLa9Pb7UmH1neSqe2RPgtGiB1D4/nEadKRU6JkuB2E3eskiyK4/ME3zKuz7OdWAXaQKBDbS2aWwogtoh5HWuBNEeXKttIXgXNLGubTUPdwrBCG9ijvljOoN8sJIKjyFVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762849427; c=relaxed/simple;
	bh=luVHMTPb9Vpm1xLPxaeA+Qg3H0BOyiGfUY8Gp1p/Ydo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZ4it5eOKCiTqpQtNOgHIb1kM/7EN3NwGN72hQa5F9TfSyeFYNrwxCICpllpun+5UNr9DWjZcZOBaNGLMfRIXJmwnTRXu65+VU7hMpid9gw6GNhTlTFwxTEDupTDIqMURaCS/ylE/INuHUPW37BVjI3kkSV+4pg6TSF5lwOSLJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w43CwGIw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w43CwGIw"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429c7869704so2931171f8f.2
        for <imx@lists.linux.dev>; Tue, 11 Nov 2025 00:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762849424; x=1763454224; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1A/s7LNYfJ23Wps55qnqVv15lrsujszwGxWt6oo6eiM=;
        b=w43CwGIwOyX4Wuqwq2jWAvyq03Nj9kER3KJ+eMk9uf+7ef5JHqciLOMgQEtn+BUtzb
         R5gWdbGbsx2RYTXvbZV24kquP2TsjPCdVGi192PyYDjygdwjZp9ib563Z40sGEGfI3Ec
         KHKvKKsBt+Me3uHdiSL26IidW/ENwKwD5Bd7M+MhL+2op7jgooutwHGNHbiQBGmMyIkq
         muXgpsi74+8Wi8eYirFJtq28mNQUFdA9QbnvljZYU1CByBN/C2fUIzuOBoJd53p2kwiO
         qmZvu3yZ3L3MoAR5CGWbLTbIZ2tkrXqyWBrX56njwCxchuN5jaQAPWB5nYUUTImfre+E
         zA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762849424; x=1763454224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1A/s7LNYfJ23Wps55qnqVv15lrsujszwGxWt6oo6eiM=;
        b=l68JgR3WYGkzm2MQuR6E7aUcQc7KP4crp8xYL5NSAm21xrBfoHGqQpiON4QT2o6pGH
         2CoXR79/PG8RwghUvJKUG+XYSDUu9WUtGe9S2tmgr71nfNh1ml9AOkbXxJKuihKP3rf7
         ouNXF32Mvf/sMaSng3inkdAItVLtfU8qFx0yn87wCt4ybMprGLw23cRMRL/g0P4Mc1AV
         Kq3/dNdoQHeJLDJYt6TyMzrKlxeV8AXLJzm9sRHaTfI1uQaTfL2Ky0xRnO8myYBzuY64
         sRiBb00+18ssj8xsxD1+8YJuERPj/jQs7g3GDnTe2lqpl6F1HXoLIEVU6GVX+lVEOeEx
         //Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUhqJXPEfsIvfTFok43DGYok+EMJ4R9pITlpvJqCHv/F8+neUTAmZ7ZhgE8kf5luFrBwjI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyye763lOqEh2vMYBj+UxJBbCWs3k21yU6I5lym5PPv6tjNetVf
	jX7ZgmW6hjybNT6QYVUSqUINz4dSpYlV2Y8qEZtqbhU8duhvZVMBJ7fJDIp4HYRNayw=
X-Gm-Gg: ASbGncvZncHMpTa4ttWU/RPksyKdeonLoPdH1jZJEqZ7n1rLqrOK7xjjib2zn1mUgsm
	erQvAttJhTtzqLI6Gi+tg9CqF7fkXkeWSf+vXbTjHfbmdIzvFyaGbfxpN1kpJRB4ih1bESKD/zk
	7wlrvPG1uukj2TOGK0PIAJcTHxIJbXVVuRT7eLeziTV+3wFZgnARM+PTr7QeCzFelS1Eii4z+5Y
	VzEUAMb37VB1uLi6olrKdIPoPhtKnwxysVamTxHbVdwrBB4A+D3rTs8wfY+kSAuWed3eqnCAK21
	WtmNF+4NBcODSuSGDds/lA+KIV17j+nAKJhdHhdyMuuKAS4wqsP9M1luFWSEbA+YlFVdsjLsSeR
	Uf27TeU2jf9W0Z/Gp+q9O4j83QUxsg2K1hx576hfa7H8GcXW4ChtEY8hBjEP2YNvRT8CGNpF4sT
	fX1mRU0A==
X-Google-Smtp-Source: AGHT+IGcFfxooTzh9xp8g3qMI+6yiTxMXMVuORbnPO/aK2mPEX+2okAsm7MZP8Iv/tFdfF65sQ80Tw==
X-Received: by 2002:a05:6000:4107:b0:42b:2a41:f3d with SMTP id ffacd0b85a97d-42b2dc2d0cbmr8067270f8f.19.1762849423687;
        Tue, 11 Nov 2025 00:23:43 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b314dae4bsm17131179f8f.34.2025.11.11.00.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 00:23:43 -0800 (PST)
Message-ID: <afe767f4-6534-40d7-b4c2-f4bf16cb74e3@linaro.org>
Date: Tue, 11 Nov 2025 10:23:40 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mtd: spi-nor: micron-st: add mt35xu01gbba support
To: Bough Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-3-cde50c81db05@nxp.com>
 <b046d19f-6e55-47db-b7a8-6c8766da2e7f@linaro.org>
 <DU0PR04MB949675657F9A4C52A0C5E19B90CFA@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DU0PR04MB949675657F9A4C52A0C5E19B90CFA@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

did you use html format when replying? Use plaintext, please.

On 11/11/25 9:54 AM, Bough Chen wrote:
>>> +		.size = SZ_128M,
> I did consider to remove the size and other flags since SFDP can handle that, but if remove the .size here.
> Micron spi-nor do not have a chance to execute
> 
> params->set_octal_dtr = micron_st_nor_set_octal_dtr;
> 
> because in micron-st, params->set_octal_dtr is defined in flash_info->fixups-> default_init.
> And flash_info->fixups-> default_init can only be called in spi_nor_init_params_deprecated-> spi_nor_manufacturer_init_params
> If no .size define in flash_info, spi_nor_needs_sfdp() will return true, no chance to call spi_nor_init_params_deprecated.
> 
> If need to remove the .size here, seems to move the params->set_octal_dtr to spi_nor_manufacturer-> fixups-> late_init or flash_info->fixups->late_init.
> 
> I notice macronix already did like that, I will add this change in the next version.

Yes, move that to late_int(). We'd like to remove default_init()
if possible.

Cheers,
ta
