Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F202D9EC9
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682204; cv=none; b=D/C4XivmEMvpjRHQmpn/xoh+Psn66BlWnqeaqpDj/RQ3R7W3HcoaW4yA46oR3V6ivrNVEYJ9MlbTkOWDsuVDp08yqdaxDYa3lpgjPOjfsmB6BrTKp5hahlpB1qQg5i4S5q9cilWwm5Xy9bPQ8SnVh1NVXxB6uzS6n7gnzKUk4FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682204; c=relaxed/simple;
	bh=v+VMI9o0BkK2V+kp3wrywxvNurGikAUy1sLctoaFuTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+2ox18r6PUw7UPGOZbJr0I/w8PNx8h+P7Ouo3GwNuPvHME2HdBi3NqRcOi2HfONN8TkMokIM3XK0cl/yBwGkTEQ22FyiLZpPy+Z7XqAtYf17dXzhaeuuuIjoW6U5YvUPIRFXgl3YVa7+qOBhS9fDq4Rd1YCAUFvUe1yFIlgrfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iE6Te+KB; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE6Te+KB"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9e4148134so3123405f8f.2
        for <imx@lists.linux.dev>; Wed, 20 Aug 2025 02:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755682200; x=1756287000; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSXQX1TpN85oW4/+/+HYjWq1kMXicfJprO2opFSejas=;
        b=iE6Te+KBjhpj/BWFC1zbO+YqQTvZ2MQK/6YY+LAtlL71NNXYVaOtsf9HB0iYYFozl9
         yCiCSrnu6FojcpiJKsvdR9TXr/dWJnqQW0ZTMD1+ucnzcRdp/TGfFUF7tNjDP2LnIE20
         2yiyvCxkIVlUAY42Uhf8HM8kJYDly8U+Dj1Tq4sGnPDcz5ZVuzS83GgVcJ0VU3zyDb21
         /t4G4ztAUzaxOib3GvMb9zFB6y3/Y4R/cxf8APBXXnemFJsMIYMKZg9LmIlJ56uH4z8O
         YyCusOHouLpL6tF3N3qMzDnhcmoRbZ77qb61gnpLPrFYos7PcEmZx6/NytB4Rtc9gx/G
         oERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682200; x=1756287000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSXQX1TpN85oW4/+/+HYjWq1kMXicfJprO2opFSejas=;
        b=Us1yoLx4FGU5/l9W5ojDDBpJXduJlCR4GERRGwgK4TJ1Dabzlp+BrFww4SWDzBkq7G
         ReGN5G1jNXxmZJ6O+qQk2Z2fDpnH9FnXEiTZ2dQlAOZp/hGjh/nElIv+Xp1mhce2HCBd
         KH2BI2e98+BhX9ylF+FXyFkrvsxHp78S73r/fwUVAGPX2dgbbzpMN5xDdkBmNSe3EuMj
         MTRQVi9wQFYs/dk/EXfNqw4rodDM5H/LDjd8VWPAJa0DhnQqWZWaHDRkfbjrUuRzr4TQ
         FzMM55SIT7p6HVyzVNX1O0dohICStp6kl5DRJR/Kv80XMjW9YCtbwi+FSxjhT/YsbMKS
         0v4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV16slbt4pUSvhBGOVvDwEzmynK26o19s5ujt7Jgr0HmZ78j7BFOf9RsvdtOPn0rvU4S7g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNlmPXlKwLKMyMurIdwZEG3qxSVBvXIwUUxmtaRGLfzQWQTfJ8
	0ApAMVvLj91M/MDnzHLM3pSaoYzrxIJ0pn6JTUO7hhm6Lq5zXsEBj1TK
X-Gm-Gg: ASbGncsqWC65wU5KKDpj2W6Jap2knjMxhSz9EmjA++0+6JDR4T1Z2YUliMKySXYjUFp
	f/J9bssq+Vl73a1B5fczrtswO/e54VhWCto4p4nSVkCPFjT79IqQwJ51a9EzG4lShFARA2hoLzz
	WE+HTUJSZcA4i2pniaUrF5fyqTUZGEqa1ubV4yUHnP6ArXa7DMt8CttODsrsUbAEYVbmcfhqSnS
	su7QgLpyOPjOHV41ThHVWXbPkaKEfldxTipHdhBSIIn9LAmLwyifl5JysSKjDiJ9z8nDQ/AFTwE
	5onh4wdh3q3N/4jq6qBqF7fnyvBnRD97sonKxTtwC7YY5lbVS8ZtoNqFZbkSOLGPv2+7tnDWLpc
	8bLJzO5C4TuC0hJgSTDnGSXpdEcqKulvLGLU0551dnp9BaGfKMcI91w==
X-Google-Smtp-Source: AGHT+IHIqaj17VsNjxB+be2CUn4JNttKe5xtKu6I/n4WpGV/LbFdHc37zcZJehduBXUBlXQI8jKxew==
X-Received: by 2002:a05:6000:2386:b0:3b7:75dd:f37d with SMTP id ffacd0b85a97d-3c32ac109admr1134834f8f.0.1755682199372;
        Wed, 20 Aug 2025 02:29:59 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4371e7d4sm30752225e9.0.2025.08.20.02.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 02:29:59 -0700 (PDT)
Message-ID: <7e75ed1c-a519-448a-ba79-5be80553a81d@gmail.com>
Date: Wed, 20 Aug 2025 12:29:57 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: imx: Remove the use of dev_err_probe()
To: Xichao Zhao <zhao.xichao@vivo.com>, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de
Cc: kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
 kernel@pengutronix.de, festevam@gmail.com, linux-sound@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250819112654.588527-1-zhao.xichao@vivo.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250819112654.588527-1-zhao.xichao@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/19/2025 2:26 PM, Xichao Zhao wrote:
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
> Therefore, remove the useless call to dev_err_probe(), and just
> return the value instead.
>
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>  sound/soc/sof/imx/imx-common.c | 4 ++--
>  sound/soc/sof/imx/imx8.c       | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
> index f00b381cec3b..4523621cda10 100644
> --- a/sound/soc/sof/imx/imx-common.c
> +++ b/sound/soc/sof/imx/imx-common.c
> @@ -354,8 +354,8 @@ static int imx_probe(struct snd_sof_dev *sdev)
>  
>  	common = devm_kzalloc(sdev->dev, sizeof(*common), GFP_KERNEL);
>  	if (!common)
> -		return dev_err_probe(sdev->dev, -ENOMEM,
> -				     "failed to allocate common data\n");
> +		return -ENOMEM;
> +
>  	sdev->pdata->hw_pdata = common;
>  
>  	common->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index b73dd91bd529..7e9eab2e3034 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -171,8 +171,7 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
>  
>  	chip = devm_kzalloc(sdev->dev, sizeof(*chip), GFP_KERNEL);
>  	if (!chip)
> -		return dev_err_probe(sdev->dev, -ENOMEM,
> -				     "failed to allocate chip data\n");
> +		return -ENOMEM;
>  
>  	chip->dap = devm_ioremap(sdev->dev, IMX8M_DAP_DEBUG, IMX8M_DAP_DEBUG_SIZE);
>  	if (!chip->dap)


Good stuff, thanks! Maybe it would be worth mentioning in the commit

message that generic messages on OOM errors such as these ones are unneeded

since the kernel is already verbose enough? This seems to be the reason why

dev_err_probe() doesn't do anything on -ENOMEM anyways.


Either way:

Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

