Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178144;
	b=ygp7cOt++OtHq8dCUMV7+o5BuxIGXw7yJLWIx3tff15Qhi5whp1sbH4LBJuptbSR8eZY
	 4wcswAXrw4ru1Z62qoq2Ywt+sQOX34modigonUVqrSx9si8sAkW2fRI/IqSFpao0hpz8I
	 eZb7+sJzbEbGVbsIl8MfOlw34RDORgSHdkBjbwRuAafpKSOTV/UgU/fXFtRpYNvFcosBF
	 Y7AYJ8j4QhhirfGKmdN0ymrX/F77NDBo2bBGgZwtOYprzAwQYW1IjtdxpA6ogq5d+Cb9i
	 Z+xhAxQ6wQtVXqXmoWxxeXF+dr3ewBWPNjlJQYJjnQR4IjFi2slXL9YDqTllgYDp2gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=;
	b=Q1nyhYQi6kRGhITiFuUlB6A/jLF0elzqMiMr1lUtEZPrLgEZEKYBNhk4ATSfHe8hfHAj
	 EVXfwR+85GYp7BeyVReEWXe8+9eVJLBxQ9onxNOB/jrIQRyW9Mrg1glz5g1kWLqLxlQOZ
	 RxAlMCcyMwtjhW6LLTojIZ5LOWEk2x/HEzZGErZLSk9NldRNppwVonWO/ZuA4pPmX7tmR
	 jMfjFNPYHjkxE7VZ/hywZAmlgBPp6BoKWrLys+9C7YK3COXfChnLanqxVwqG64twSFbPw
	 952b8HJfYpAyL5AsJ+LHiaekZyO/OiBHksGY6DbwJMGpjpAsQeoneNrNNk5fhmVJoxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBQo+mTX;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C1606A323
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 09:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A21C1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBQo+mTX
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so429438b3a.0
        for <imx@lists.linux.dev>; Wed, 28 Oct 2026 02:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178143; x=1793782943; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=;
        b=uBQo+mTXbQMjLmu6mgCMv4tCjib6JYXoc1SQUnQH7Od7EuSQ5UTJnPVw6h0cKBSC+y
         qcvjlG6W+TwNSN/C4ck/qn6hMLv+qP10ffybwCwOhTmPzuXamFyKuHdrkBuTALXaCFt5
         lncMYOpkhLmDJxkqMXF2fggaqNkeIBYKQ3zLlpQcJE5xtulWI0W+fcJv5kWDtTl8JV85
         x24PdBTcYFbVocAgmhGzUTGnWq3GEP5j+trZa+VhAyk3dlo7f5k6bAm2CYkIOXVhrhOS
         65iqlYA/rskYAHbu6Rd24dZKaIJYbn1DH3vUtZXI6ftVVIjHewIasfhBBB1XAGPFo5Uz
         cnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178143; x=1793782943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR8gKvzZM739OlJnXa+9g1824BNxWUNsEDlub78+UpE=;
        b=esJyOIQ4ZWnGXxPjuRxcoWG9sSvL6KGA/lPC0ThLSZAdpC4TCuuc6pjB5DJ3mgl4nT
         i0R0AOJngfItU1+LXlAs2jutGK74qP2IiefQM/sTtaGJOqK6tejRPg3g/srsPk+ZKRlm
         5IG2hqg6qnh9Nm7RBYh6Dy+LivzwlSXjwoSoDQGiQaD09GbVrC8wwLi6KgS9K8R7lGN9
         CM3eOPcVGkab/tC+Y5o+P6v+jHOpFu3EMgUHy9z4G5UQWIT3Y6S5KfCoHI7GdB1ypg0T
         hc6Sa6Ew/syemZ0RdSJBsN27jmUvEviE77XzFjdIkNFjiofCdUkKVZPF11HwrNAjAarL
         prjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxP+epxIuxdvQgQcBrMHoAN41EojAVoRAWGBxNjG5ZETanyu8/P+C7D3Epgx+xfEw33zU=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ0cuJPXHDOraPUwRo7FSMpRVhXMrekbl1fyQgEWrzVqejl0MXr
	aWWEnfsQlKjsYrnVTZLV3DVuNwirtZia/OBR+QzTg8KAemnPT7w3+jHV
X-Gm-Gg: AYBFou20XV+uEkLDY+0Uqrwsju4H2qp39gRg5WbFSL8e7Sh/vvfCZX2zZOKzrbm4w7p
	MW4+c91n6H9FiznnZ2tElV/sHdJpPilNRgCh19BwYlQm79zhBc+oxvWHfS3qAZ8v+wDxG4As7HQ
	gTpBPSvyUHrxZ4/YLX9Ac6Ld9GK0qTmRX6n4uAo1p6lUrQwGGoCNgJ36EIiJ6Vdf6az/O37FHwX
	f4jIZdr6a/ENfVlsbC76c8A6FEU/w7GJEnd6MuaRbvrxhQY1rRCSjG4TcvvkeT5ofLC6y7gXqsP
	gWzZOFnU6nPhu4QjoJW+o0CS+oDODTR3BN6AryANPzBs4uahEIr5Xo7X7q4gTm+YuyvwMXELmU9
	bjGQ2mPQOHnyzPHCtfQgFBHpgdYl/DRx5H10bVDu0NKqwXmZbiR0jeiumFZwwugNOEBLWhqFScN
	yuC+9gNuAt0eBEvL47RJpURsLWmxWkTwmc4T7VZ9mS5Yk8j8+z84iSfJCf25L955WE8AS41YpzZ
	H+VpGHns/WOLWMGX71wYIYT6Ty4vDzQAJoyALfuj1xni/Oz/leoDg4sIt+PZOyalxajI1dqJlt4
	NWaR9qnc5bF+Wfi2NIVKQkhU3n3PJ4oakwhwtnWe4h/d4m0P
X-Received: by 2002:a05:6a20:9e48:b0:3dd:a195:dd55 with SMTP id adf61e73a8af0-3e9023e52c4mr1537814637.55.1793178142953;
        Wed, 28 Oct 2026 02:02:22 -0700 (PDT)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm3790062a12.8.2026.10.28.02.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:02:22 -0700 (PDT)
Message-ID: <116227fa-96ed-494f-805d-ff54aeef545c@gmail.com>
Date: Wed, 28 Oct 2026 17:02:12 +0800
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx952-frdm: support AONMIX MQS
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/2026 11:16 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add support for AONMIX MQS (i.e. MQS1).
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Changes in v2:
> - remove the duplicate properties with dtsi for mqs1 node

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

