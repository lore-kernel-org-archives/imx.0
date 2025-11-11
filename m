Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFEB31BCAE
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 08:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762849753; cv=none; b=IUYIDrohKGg44ZMcZ7NaAsu0GLtF6sVXHDa/lAUhuimQbiS7FUnxDYLuxOgyAcIrg8f0+u5WFhtc6IZ4W4ZAWiNWWfberd0DRQtWibLg5ZH/liRoYzbVLKxhfQy4rEG3MP0v1er9hDfXE35B4CJwEu6nRWdQk7Y9GZiNhdejr6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762849753; c=relaxed/simple;
	bh=10TSvv6HjQ0PvGW3eNRhtcZMYyBdUfrKwKuyrp7+khI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boxJXtwHddfH/gpibZadfRCQ2WH09RvqjNty630Z13nBufCBZvVUfosHk2ebX+QtKgMX/7XDFuIUO6ysRCybcb5fxuaNXcIVNVmglR/wd2bOXwrDBESfh8Zbff6CjiUGd74MCXYr1ux4QSE5zCiRIq2nv61+ReOL+cgCIoAUiv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCheQwJ3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCheQwJ3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso25293445e9.2
        for <imx@lists.linux.dev>; Tue, 11 Nov 2025 00:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762849750; x=1763454550; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VN4ssHT4SWqYZ2DLb2tv38+O6ZY23WjOxSeg+Op1aEM=;
        b=UCheQwJ3izSmFYrFDpoWBKmTysF2SmzBKDbeTz9pvakFxzmpc/s7BWKDoukPdJv8ht
         ZuQSGvuqzd4e+bBAJVwXxidPnr74BTFHBDm+QBC8gqb37EscWPqBN/Yb2WeqxlDxQWem
         KUa7R4bXSavBO6fwvdIiuy/Nf9s+Jqe0kcdog5faLT5gPcaKR5ItjoCIka5BQraF38tf
         03rnL8SgTX1+6GQsNhz1n4qIxS1mWt5qu9fzF0VTSS0vXGaNdGOryUbgpn7FnS5l50Wp
         BsoGcO9dOEI4bJMVyifB0Ke0pBD5jUU7JsEvQ8bfxsN8LkW5rhsMkju1GqGV2gtk4b5G
         BBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762849750; x=1763454550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VN4ssHT4SWqYZ2DLb2tv38+O6ZY23WjOxSeg+Op1aEM=;
        b=tDQrPPfRz8TziLTNXbxEtsES4+Jdff20TEec6hfC3flBKZzD5LviC3bBpkIOf/45ai
         2f1rfKvYy+9Tohl0Baexv2W22jdiOKyr9jbD0xIjXcy8pQ1P2TxdgpRRn7ZOBnL3FuSf
         pyyBMVthVfrejg8akUapLpgym1iBIYw5tfPhKLnjSBrP0PNPw2kYfYgq1VMPlBm/pUNg
         mUJg9ZVMX30e0U7j1RrkucS2sxhXHgGcckfvNBFLv08Uox/L/e35wOa0injzLXEDW4Pk
         susvWfBBwPe5pBwOdK3trGeFbKImPS5zHx7zgIxNVRotgQApujN9bhC3iqwIuPdbmyMk
         VGzA==
X-Forwarded-Encrypted: i=1; AJvYcCVKBYzHwLJs02Ze56fhRJ6iFOXJdSxqymyvw9ofFIpfKMUstAgG+XmYnTCc9LgzOakPmxI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIT3AM48G0PhOevMz+lEdU5zBAreZBsZ4XeVkkfXhg4JvomtSg
	wK1JL4Q3v6MISMf3qrjYhxiBwfZY13JC2PaqPx9tvXmjQqC6qDl8qnzzxKSUpk46PBc=
X-Gm-Gg: ASbGncu8kXvdTqPAIjt7YM62z1rowlgsf9kbnr+quvRf/7dEK2LNUj/g1HVMH1+Eq8d
	0V/5ZRkcq/PrV4YUHM5Y2rTC//ybhNhY6qXKnF4MU5HQlcoa/igijV+tsf3nStrXuvnsD/ZQ2G9
	K4D1D/dNIht+FqRaqfln4uW23ZojXku+E2Zzvs3HKXAW7Ia2xKj2h19v/Igibj38fd4/tqAVT3Q
	NL05sJ2CJEAVa+gz3IFb8WiQe5+uNuCFEVOIC+tGfSpNerSAWvWwOTdatFEi2KjSIOcbe4AxNZ3
	SUQSZtKULcBxoSRl5a5dVQsPs9FRS+6jMllhjUzlwhiUh1PV3xe2+u8LaPKN5w3QeGP5CelNadS
	10HSPi2HlqphdQaCNcA2KgiQkmowN+eEUwjoUVwybu8D8xdVscKY7QuaNacJmUXUJg3lohYszqX
	Cge2gblM6lDff7gPbz
X-Google-Smtp-Source: AGHT+IEjfzQTdf31JT46i170Kox8+e9rzC9EAL1JgWdVxYnSZfKWgA72lGNi/67uAlpLK3cpt/PArA==
X-Received: by 2002:a05:600c:4f0b:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-4778049cfe2mr34227345e9.2.1762849750375;
        Tue, 11 Nov 2025 00:29:10 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2f7a0512sm19591853f8f.18.2025.11.11.00.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 00:29:09 -0800 (PST)
Message-ID: <8263aa0b-f223-4e67-9923-9f7882b90646@linaro.org>
Date: Tue, 11 Nov 2025 10:29:07 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mtd: spi-nor: micron-st: enable 8D-8D-8D mode and die
 erase for mt35xu02gcba
To: Bough Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-4-cde50c81db05@nxp.com>
 <7d8b0062-a6ec-43a9-ab00-3e11f0e2fb26@linaro.org>
 <DU0PR04MB9496D24A8424C578C942CDE590CFA@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DU0PR04MB9496D24A8424C578C942CDE590CFA@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/25 10:00 AM, Bough Chen wrote:
>> please dump the SFDP data for every flash that you touch, it helps us with the
>> sfdp database
> Hi Tudor,
> 
> I do not have this mt35xu02gcba on hand, I only has mt35xu512aba and mt35xu01gbba.
> I touch this chip because I notice these three chips share one datasheet, and seems only
> has different number of dies.
> 
> So should I drop this patch?

Ideally we don't change functionality for flashes if we can't test them.
If you feel this flash entry does not work okay, which seems it's the
case based on your previous patches, then just add a comment above this
flash entry and tell what should be changed. Then if someone cares and
have the flash, can do the changes and fix it as you suggest. Does this
sound like a reasonable compromise?

Cheers,
ta
