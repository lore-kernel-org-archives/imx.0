Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE1A2BEC25;
	Fri, 11 Apr 2025 23:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744414632; cv=none; b=kaZGOOzZ9KpijQxwfHpUiXxewZcDIW4+QkMcNC5GnKwkyFf9+NbljA+irK7iZdMFZWOTFgumEMuSii7Oy4m0k43qFI6VaoT5fXq0RdkHBCsOZnY/D2Bl5o4hmFailrQx6nf0LvCdyL8r90Xx9NsPKYbCYFqcOA/wQq/Oeyo6NfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744414632; c=relaxed/simple;
	bh=b/3gzVMfgYxEZ77GHCaJmjb5ba9wNIawHHXzPE8U/VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSdK0XeMksMvwUly0wAciT5/1xAmx3UwPfytAJl//kDgrYa01nkxJUiHwrBheNYwnZIgYbb/3XHEWorMSMqOdIrQOJVzll9b8V39KylPOn8zfrcCVztgeAJLOE1FgOBwUAnftUDepS7v9YV76I3sENWj4WEE1sQNRdc5j0uvL0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvaGN06o; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvaGN06o"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72c1425fbfcso1540627a34.3;
        Fri, 11 Apr 2025 16:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744414630; x=1745019430; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TKjBnAI0llRD88HQinqqWPzae0oerPBARTmSqosHWIk=;
        b=AvaGN06okDp2eHxprsci9CAiV2qWlJmeD3Uwjr7wf77tYxOxttgoY5QbrPMOhKYt38
         UooS20xZ1Ysj0kNKOX3+c1pDHrumWjFyKoOzeMmkokP6QSGdYIFgf3vo6pQbguvvH9S1
         myT2e6jS+BYpe99c88TRPQRdX5DQsA0HkfMqSy+92JVQlRHiW0rOkR2SglKA5kknRvlE
         qt9T8iEhOx0foLUYJBpnBIavXoaVMl3NFcViO1TOnpvbAzn1kTdKgMrzOpjds5AiNA1P
         iBfYEt3Bctw69W43Q3ue3ZT23MzIcpgL8EfbzvN814LESTQ+WcdBJF1FRKXbe6KPCyo8
         XOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744414630; x=1745019430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKjBnAI0llRD88HQinqqWPzae0oerPBARTmSqosHWIk=;
        b=gwj8URGyfVLllPQnxfvaG18yLqGrvxBYPdZNATrApWm4/QBMlo9hDfaQSy6b5C5Wmv
         iUTNjiVccb7MKXQ/EAfOFsGx9KGkXm7Ed/vGoKkCtwRJrQK3p+k/o7A98eHCQ7sREInX
         oxxkYHUyxO3bHtijl8tGz6vEko04nJrwA2iSdqneNvKmCc6VxRyGq4aDgZni6PN2uh9U
         TtxyzU2uQCUeYi9Dyx6xZ1G/Swv0kQoB7HginwiUQ1YamNkJSL394r6aDtQ2EtngMw/L
         W9svi6/0hkU/HAecNfHh1rU8yrZsXh2vmBnjbSx3i8ukaFyF36MaGJvTfrdIsETCpjtD
         oy2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUofaM8vLQ5IDsHhmeE7z3hGx4zhtrdGahpM2N2UKLsEeLprZpC3cvom5ZX29JRp/qjMHm1T/500jMpJpA=@lists.linux.dev, AJvYcCVl4TEnjznLWADDjGlDcl2E/cT+y59ozQKmntSdDJIBZNIBBujAmSiNhVyzmJTod4HW+t0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp/JXfNnGjiCGO4nDvO4XTshET6pXXQLz3W/zvet0v0FQawxXF
	VK/jtf4tcVe6YwCmFwentK0N7KJzzMHzudUumfvlCdft6IPESg+W
X-Gm-Gg: ASbGncuQ5NggQqjQkF2rdLx8emXoerZKKif7+2und3azduxiVEJWqSu9HBOmBHfMbr4
	W0O0ZKznc5jyen3XpHyU1VqijDTNHAMsuIOSl8p8tGnytkZ5k53TAKqiPGW7Orte+8IZqfIHO1A
	ZJStyCXVFFP0MFK55TWeTgXNnxbNGe3gv6GZDsSSETb32AKuRHtcs71QusE76a059NHx2KgxtMH
	N/C4jHAH0IUPQ9QIOekk0rG+bBQactGjUNIvoNWvqWrhDZVvfIvY+MuwNU8Z97OngG7+HuYwygh
	4tTB30HIHsqQHr083MAWbPRjUwh5pvUW5aQE6+kn0AC8sY6JBZXjIyfAIyGdoiZmIK5O
X-Google-Smtp-Source: AGHT+IFJfzFy8MikJxGoTFLuN6tcrmJtPOA/qBHSB3opFc0xc5RXfyX0+z3ecAr5bH4Qt7gKQzRQRg==
X-Received: by 2002:a05:6830:d1a:b0:72c:4032:76f with SMTP id 46e09a7af769-72e86304edfmr3726235a34.12.1744414630055;
        Fri, 11 Apr 2025 16:37:10 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d7140esm1131783a34.22.2025.04.11.16.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 16:37:08 -0700 (PDT)
Message-ID: <0ce8559d-5c7d-43a0-8177-7704969fd334@gmail.com>
Date: Fri, 11 Apr 2025 16:37:03 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] arm64: dts: broadcom: bcm2712: Use "l2-cache"
 for L2 cache node names
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
 <20250410-dt-cpu-schema-v2-2-63d7dc9ddd0a@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <20250410-dt-cpu-schema-v2-2-63d7dc9ddd0a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/25 08:47, Rob Herring (Arm) wrote:
> There's no need include the CPU number in the L2 cache node names as
> the names are local to the CPU nodes. The documented node name is
> also just "l2-cache".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Not sure how you had intended for me to pick up that patch without 
copying the maintainers.

Applied nonetheless, thanks!
-- 
Florian
