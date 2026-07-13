Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750A6437448
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951101; cv=none; b=AVgK12mGb90n11/FPsR9DvCsjLREjNuGXXt5bl0zH18Vb4IbJYrhvwDckURXIzZ/HrlJ++1WzVaoHtFPAPwulmbiNIcfVhc5Qqdy03SbjEZAuHLZIhJABxQMrmMOFqb0lX/VsqQUtBop8hQfwx7Pb7bLgqiT85OaB8Uxkhsiymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951101; c=relaxed/simple;
	bh=bORXzJjP2Dfw35RFATyq8+QmIAsmDVQH2fB4Fe8Qyc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MsH+KmJmR4vV3h1WT3uB0EbeHXNOHNyrv9t1o65scpVsPldL2l/ZlpXyt+s4sPjbqY57MFqN9KVGko/3ARdu9oGndYmarO0ljArCdgmvovJ0Ykuj799tQsv3BYeC1RPaeI97Zq9vxCrM1eJGZDfBq1sPM3PStDnaI94HU/bab5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OJEwfYta; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OJEwfYta"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1731018f8f.1
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 06:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783951096; x=1784555896; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2WZcvn6vs6I8Vw4PEeFfwOApkB0Qqs+RPBrHY59/eg=;
        b=OJEwfYtagTL7ltSzyO6VEA8qN8ZZ5Jh1VubAbfpdbn0MP5ZUpDoOm7zT8kw68L9uw6
         LS+32wDymviQlog/n7NBUR3A1BreQIYkmxLmaYwysfmxxUg8pqmOcIqrpHxbnUWGlRYe
         xxbJVIY+n0jx5qfMgTlUGSASm1+NwfnTRLrSOLxjpzHE3di0RQ29aqxbVSx5poyo/Tmk
         hUShBA62wZedSIHThgnu8lX0kCbEfOc+JY8sM/M6c2xS/n8yywSwClLRm3Do2LqMDpxX
         blyk/U5nSI7ffUsuLtHN2PjVTqZ8ITHsv3Ip+xcv1RcvNECU+h8A+8yTbyB3OOdTo9M8
         qMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951096; x=1784555896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2WZcvn6vs6I8Vw4PEeFfwOApkB0Qqs+RPBrHY59/eg=;
        b=dhclKIWvpeHqgfG8zInNQvz8CISRQYayr58UwIMEyYMpc890YmTk9dh+pLYVKZ88uz
         Tlyw7fDSAhXTTpVN98C4ao88FA7m+7H98sK1WwrLg4OKWSIfU16olvbpX2xeEzDLkXOu
         23cnc7qPB3xuEjvZ5xaM5LmE0ugt+LtBS3yCZYepAUN95AAOM5dUPitO1DOxyG8Hr4CE
         O0PnniTMBL/Bw/1HriuktUuKLtswluhsbx7SgxEwbrUTEI//vIRuF/QEpzq7MP3c5XUA
         qZ2MXH0PGvBGH3vYhIyBG/AGVVC/LIdckh2MxWkVGvpta5v1jvKA7JFco0kyNzUVixQs
         r3Mg==
X-Forwarded-Encrypted: i=1; AHgh+RokhqLT5oekj9IYTSQD4cut/3nh7KbFVUOv7OGuY8TdB8/wHneIWKBM6yXTjzfhQ/eY3MY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXNqdFXKwMbECvBzPHUg2cUUzq3VQfgE3okSGtkli7+MIpUXG3
	WU48XxEoOuPfnQC5ihs585y0/k0uWWvIE70QVMieTAaKtO4jAQymL9DgNLk3tJ5D+Eo=
X-Gm-Gg: AfdE7cn2q+YZ5MtaVECsnt5kY27JhkGSXakQ3dI02ZMT4Bj+s17wjlFUnTfXB3YP/bb
	tOYe/sN4zHqKfLuddj8ogfML4B0fsFTpZYqXwvMBSc/eDuTZorPNE26mNyZkZBbKWYYmbLUGZKS
	ihX8bnkuciZdyYB48fGXNSA93aKrdLFCkjvF9xoBhQAXakE/wV1w/z3xNyDka8xfThvNqumMCu+
	EDNLoeKomdDyj7Hj2dcabCiXFK1egOXxmJRP8rh0FvWpA9rs+4vVKVuBEZig+jBYhjQS4M3bq4b
	4oIDkEXD5TDNkns4QT/DcQWTwvg9718L/Evq1xHSoi8QEbjJW2SRNn7Ivne2qYLafy2X73QlDFG
	Zb5DmUy5SQPWFCPAumghVZPYczhdUj02Z9jJPGgkKFLqcsXLVPizPq4Jo0sG2ks7NR+9qmmlxlQ
	y/lNzd6wNKzqtgMv41Zo8M4rh+4nP/9QBsE51EO0Ple2LAsmorEalI+/HXecP/+Bk=
X-Received: by 2002:a05:600c:6989:b0:493:bfbf:1da4 with SMTP id 5b1f17b1804b1-493f881de65mr90870545e9.22.1783951095834;
        Mon, 13 Jul 2026 06:58:15 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6402:500:e91e:fe5e:857b:d0c? ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb74b3edsm426933975e9.15.2026.07.13.06.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 06:58:14 -0700 (PDT)
Message-ID: <01a66774-1033-4377-a6ab-6333023ced03@tuxon.dev>
Date: Mon, 13 Jul 2026 16:58:12 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] i3c: Improve CCC reliability with actual_len,
 validation, and Direct GET retry
To: tze.yee.ng@altera.com, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jorge Marques <jorge.marques@analog.com>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, Felix Gu
 <ustc.gu@gmail.com>, Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
References: <cover.1783493867.git.tze.yee.ng@altera.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <cover.1783493867.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/8/26 10:17, tze.yee.ng@altera.com wrote:
> Adrian Ng Ho Yin (5):
>    i3c: ccc: Add actual_len to struct i3c_ccc_cmd_payload
>    i3c: master: Report actual GET CCC payload length on success
>    i3c: master: dw: Map CCC hardware errors to I3C M0/M2
>    i3c: master: Validate GET CCC payload length and retry Direct GET once
>    i3c: master: Add optional_bytes for variable-length GET CCC validation

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
