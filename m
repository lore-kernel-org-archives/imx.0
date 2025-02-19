Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0944C1AC88B
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 18:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739988704; cv=none; b=N6FbAwj6vLC+L9dz97SeCBJhdLiJ9xCxPI0Xg6hclz/D7stIiwHywEt5QyhdPGN59L3gLwd1zyIdTrYX9pGLLJ4GDkuEpSwfuXlXm4WZBUFZof+CpqDwGsJfenr0I60bO504xJN2wXe5lke7KfloiAFYKfbp9fOPUdCUdZSRq6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739988704; c=relaxed/simple;
	bh=3LZDiVVNFHrrTvKMy+aaUFJQiQjaTqA2aBCNOTEezAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7KtoOh7KJ/OWQqtrSoLJOTsrwll4Rk4l8TVhf4D/oVgW8tP9yGXoSvM4XvVWMK8ry3FeP5Fw/X7DM1leWb/IkeDaQaMhDUijWAdSasqor7fgfHsY5oUQhLxFYfol4ukemKoq7cQf49uBB06i32WbeiLUOrnx2B/Q5pVBUwuNTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZ1sXWd9; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ1sXWd9"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abba1b74586so18472866b.2
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739988701; x=1740593501; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EX7iW7aQk19gr4mr35uOFeWPZKaps87azPiJHXGQMpU=;
        b=gZ1sXWd9Xp723o/A1fFjKsu5dme6L4Ug5ou0ZP9yupISo054lSytwNIkeDEBLMEN/W
         mw+mCMy54wmJ3z59Gtky0c//l7VFxTkHPD13EkTs70I4l8bZ9LHDlL3WRaJAiffPnsG7
         uiXJvbhYZo5dgIm9/O1evYFiijkdxLGT9lSREerbSy9U+PUYJyng7PKsk0usLkwWsJIr
         0VQUZyeN3de5KZDQvohJyEk5Lh+QKN8fujuIUinDkAImGyeED7xyTw15nQtspMnVEKKv
         QgWpYgpboirI5ZR7VJ2qXfauXE17IbVFyzd2LKfELIc82d+YRCg5vpd4PxEqg79rNjEV
         wbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739988701; x=1740593501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EX7iW7aQk19gr4mr35uOFeWPZKaps87azPiJHXGQMpU=;
        b=GJy0OqK8KpFtm4tyy/mxNCsqa5P+L8WKE6lF0gJwyMyGm/5YRSaPnLQ9d+9a539oww
         kec0+P4XLCLcZh+N1DtRlYud34cFFc+dP0oTJLCOBVZXaIzi8WrSuv0oSmx0RgVGOPYD
         DoEQfgm/gPbU0Mj7Ws5a6Cdr+Wy+qpKWF+JWP7K0vGOQuebNTiJ+Z9DVTanSb6OAlI7H
         OR4eLU+AQB2cxOQaMjT/GMY6dHHI/wGquTptlWCRBPta9XkFt++LMTvQWCZVSV9I05Vr
         o+Q6j0xAB2ED3Y1dqHwn8M8+ihmqmck44y1ZPZDvV0MOxhZwO/zuwL7vH7nCpsz/8X9b
         rF9g==
X-Forwarded-Encrypted: i=1; AJvYcCWMohOFtSO/5+pvbl/CIugW5iHVKyTZGryMBxeksy4NeJgxQzBnY1Sp7qd3FbE1RdhZ6co=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOjzjATF6OIAfkN7OVDu6+kU05/5H+0NydGbHJfFkGpXrOcLxE
	lB4khEXss3+DaWDCCohaFnfxBYbobvyO+4y8pTzPEBlRlDLLAdZ0
X-Gm-Gg: ASbGncspgKNiGR/EA9czrpY8ucUR2Yc6sbalkAacmMh8Bp0w8J04FnnPZIU2DWR+/WO
	qb87kN5M96FcaAJ/Ch0roVvMKkLb33S0OcLvfiSSfzMvn7lJoomNJ3QJx/NKUYEsE1NUWJz7wyq
	3x1GzdDPaJGXItnazHts9WzuCyckz4t0zvXmVow7p3iYT60al/1c7bQmodtneyBkGHlDgnWPNhF
	W2+Zn/OlE58CmUYHfI2tPHvVea3i73ksNHUvN9AXmqZcTS94bmE5NQ+MVU2ihSU/mg6sEBiwEX+
	uuW3fb5lxBrGzVARSJGx1ITPV4HPjx+6uEFSzFczPEG7GjM=
X-Google-Smtp-Source: AGHT+IEJpTPW7wSmUpDukWtijT9eGXBjCmFlUxZGRjvR2GsGxyDjjg4XrIW4SthKGdN7ujvQTG+O+w==
X-Received: by 2002:a17:907:934a:b0:aa6:9461:a186 with SMTP id a640c23a62f3a-abb70dd663amr1847442766b.46.1739988701033;
        Wed, 19 Feb 2025 10:11:41 -0800 (PST)
Received: from [192.168.125.132] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba7c63162sm524674566b.182.2025.02.19.10.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 10:11:40 -0800 (PST)
Message-ID: <ceca2d24-78a4-48bf-872d-71866ad97b92@gmail.com>
Date: Wed, 19 Feb 2025 13:10:41 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
 Stephen Boyd <sboyd@kernel.org>, "S.J. Wang" <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
 <DB9PR04MB8461866A0B6A068E49D53FBE88FA2@DB9PR04MB8461.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <DB9PR04MB8461866A0B6A068E49D53FBE88FA2@DB9PR04MB8461.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2/18/25 08:43, Peng Fan (OSS) wrote:
> Hi Laurentiu,
>
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Subject: [PATCH 0/4] clk: imx8mp: fix parents of AUDIOMIX
>> DSP/OCRAM_A
>>
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by
>> setting it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT.
>> Additionally, set the frequency of AUDIO_AXI_CLK_ROOT to 800MHz
>> instead of the current 400MHz.
> The patchset looks good to me, just one nit, 
> Should fixes tag be added for the patchset?


sure, will send a V2 with that

