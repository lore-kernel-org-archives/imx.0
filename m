Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487E9267B6B
	for <imx@lists.linux.dev>; Fri, 14 Feb 2025 18:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739557248; cv=none; b=YwdVYo1HXFedU9xbwSb6u1yDvGSwaGRNpFiGeZ4xkc42RLJ1Pmg8kNInoMcbJyXc1vhDB7k6f+vPnjkHpbZbHryaZaQIivFxZIRjIX29R2Ar4Za09VUEO74LdMgxRvBxXGGZnPTxqVFDgPgLnBXDV/UXDR6if+IpzlE5oKxbIts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739557248; c=relaxed/simple;
	bh=hGm6bdP44W45VjFKx4g3WtxK7XzlXxi7Onetxlpq+ME=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mHfikz4QpUDOfVTT7cZ2pm0RJPqxeBQPukUaee7ROa7YlyafeNw2cTj7ETd5DCXnrqLL0enVd1vuwIpGXFF59GC3Fdz+t5GsrwzFTDHhA8rvbHkNUKUin2T39j0ITL5onhc3ZtGvtjYbEGbObXFFbvQbwQadfLifEYa4RvswXp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bwdaiPEX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bwdaiPEX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f2b7ce319so930996f8f.2
        for <imx@lists.linux.dev>; Fri, 14 Feb 2025 10:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739557243; x=1740162043; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LiwQPv6ok4yIcjSGgvmUI+UqSRNOd6zqIh/ZijyeTno=;
        b=bwdaiPEXRZ0mw5yumkcNpbQR2jcpWMNn4ZrWuHe3DmlwIuoFA2MzKsjYHKc4C15zTd
         dLQqV2+eqUpLq4L+RtDuoV5cbtZindZfEhP8OjDQaIPl6rnFfSVLcqfndMXZAOOYSdJ6
         tNTDS0H0g8nchyg79NMb3qxkNTGn17/I07467NVY3z3u2PnzWCWitX78L0d+0z3AtVkv
         oBn65rz9SEdf7l63TADxtwzmcj79CyNC+MxNJvdusBVTF41GgQ2HKa8qHoODnonbkzQN
         NZzbbo7+tPdYzVmuH8bt42YxN432FitvMKDNkDuNLqhQ8J4D73lV41u2UMs9N+AgdP5j
         Errw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739557243; x=1740162043;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiwQPv6ok4yIcjSGgvmUI+UqSRNOd6zqIh/ZijyeTno=;
        b=qG65xefnrUVX0mNBeRACMEho22jPJ6zHf5ZqotfyX0hdUv4X+/iU4SyTt+9lCh98M0
         8FsHpvbiDQmmJojDT21y5+d0F0WiwapF0FkPuw+a/X1mAvGFihSTZeEyRWq6uommqYnb
         kgv4p2WTPuYLCyA2TsiFooQx9gzmU+r8UpksDmzL9td0A3x7Jn7h36PsSXMoCCbeGlF2
         3NAT/qIrw/EXvy5HYKIi2S/YbfRXSBcWo0qdtS4HPOXtsHf45vebPXuylTumBMldKHGW
         rVDTMdZGvasEblJIaElU75bxOFfEWmVmobUto1D9q5uKawDJWBi6LCc1xUAiuw1bKIqz
         eqdw==
X-Forwarded-Encrypted: i=1; AJvYcCV2g4SklRAzLG/42DccJUaQsMK9YA6jDKl7iqtvNSUlqignZIDwyeLBN5Pmity8BuYzpZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwW4DZA07r1dJdOvu6C+HWq5+uqRpl2Qo4ti9mlXRuOgkCyENJD
	AweKqmHf/8YZ8dzYxIEH+MRXAzOuILDbHUZ3YpLfamWM2Qmx08DxFU1ivbXrUnA=
X-Gm-Gg: ASbGnctREd/fNfBzTo3Of/4p8fDidM0eAeixWtgvBuPDqTr/eKn9TgvnkHlqOziHGSz
	FjAaIvbDrcF1D5+gYSorQHDG82Fg+4h/0/8gjVnbopj1i/BRggAB99E240iFkvqIg/NRatnv8IR
	1cT+ft0nDsUZpQ/9M5ADOEfCuqfmVuQeryc8spOPYvd9Ou6jgCGYmkeA6uHXFGFNj9+zLVLyHSQ
	nmSMC6XMwRnI5FlY+QnpxUnd1POMuGHJ64gajnP53hVkZ53wuFX9eWHQ1B51dzDdOO5IisK/zro
	+3nXPgDtvMXn0Q==
X-Google-Smtp-Source: AGHT+IHsTHTiL3wJj3nrHf3yF9cKckC3Rmpa9H0r1If+8TaecjIo4Dqny2vOXtw6IlfG2e9gn40oVw==
X-Received: by 2002:a05:6000:1542:b0:38d:d4b5:84d5 with SMTP id ffacd0b85a97d-38f33f14a9dmr31093f8f.8.1739557243484;
        Fri, 14 Feb 2025 10:20:43 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:7018:8c7:bdd4:3436])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43961884e88sm49912865e9.26.2025.02.14.10.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 10:20:42 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,
  "Stephen Boyd" <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,
  Danilo Krummrich <dakr@kernel.org>,  Conor Dooley
 <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Douglas Anderson <dianders@chromium.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de Goede
 <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  "Abel Vesa"
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  "Pengutronix Kernel Team" <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  <linux-kernel@vger.kernel.org>,  <linux-riscv@lists.infradead.org>,
  <dri-devel@lists.freedesktop.org>,
  <platform-driver-x86@vger.kernel.org>,  <linux-mips@vger.kernel.org>,
  <linux-clk@vger.kernel.org>,  <imx@lists.linux.dev>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3 6/7] clk: clk-imx8mp-audiomix: use the auxiliary
 device creation helper
In-Reply-To: <67af6c284c349_1614f3294dd@iweiny-mobl.notmuch> (Ira Weiny's
	message of "Fri, 14 Feb 2025 10:15:36 -0600")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-6-7edb50524909@baylibre.com>
	<67af6c284c349_1614f3294dd@iweiny-mobl.notmuch>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 19:20:40 +0100
Message-ID: <1jr040xu9z.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 14 Feb 2025 at 10:15, Ira Weiny <ira.weiny@intel.com> wrote:

> Jerome Brunet wrote:
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>> 
>> Use it and remove some boilerplate code.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/imx/clk-imx8mp-audiomix.c | 56 ++++-------------------------------
>>  1 file changed, 6 insertions(+), 50 deletions(-)
>> 
>> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> index c409fc7e061869988f83c7df3ef7860500426323..988a5fffeb4e0e481ec57038d9d1f1b43432fc98 100644
>> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
>> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> @@ -228,64 +228,20 @@ struct clk_imx8mp_audiomix_priv {
>>  	struct clk_hw_onecell_data clk_data;
>>  };
>>  
>> -#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
>
> I see the Kconfig ...
>
>         select AUXILIARY_BUS if RESET_CONTROLLER
>
> But I don't see how this code is omitted without AUXILIARY_BUS.  Is this
> kconfig check safe to remove?

Ahhh that's what this directive was for.

I thought it was really odd to have an #if on RESET while auxialiary
device was supposed to properly decouple the clock and reset part.

To keep things as they were I'll add an #if on CONFIG_AUXILIARY_BUS I
wonder if this driver should select CONFIG_AUXILIARY_BUS instead ?

>
> Ira
>
>> -
>> -static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
>> -{
>> -	struct auxiliary_device *adev = _adev;
>> -
>> -	auxiliary_device_delete(adev);
>> -	auxiliary_device_uninit(adev);
>> -}
>> -
>> -static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
>> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>>  {
>> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> -
>> -	kfree(adev);
>> -}
>> -
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> -{
>> -	struct auxiliary_device *adev __free(kfree) = NULL;
>> -	int ret;
>> +	struct auxiliary_device *adev;
>>  
>>  	if (!of_property_present(dev->of_node, "#reset-cells"))
>>  		return 0;
>>  
>> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>> -	if (!adev)
>> -		return -ENOMEM;
>> -
>> -	adev->name = "reset";
>> -	adev->dev.parent = dev;
>> -	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
>> -
>> -	ret = auxiliary_device_init(adev);
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = auxiliary_device_add(adev);
>> -	if (ret) {
>> -		auxiliary_device_uninit(adev);
>> -		return ret;
>> -	}
>> -
>> -	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
>> -					no_free_ptr(adev));
>> -}
>> -
>> -#else /* !CONFIG_RESET_CONTROLLER */
>> +	adev = devm_auxiliary_device_create(dev, "reset", NULL, 0);
>> +	if (IS_ERR_OR_NULL(adev))
>> +		return PTR_ERR(adev);
>>  
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> -{
>>  	return 0;
>>  }
>>  
>> -#endif /* !CONFIG_RESET_CONTROLLER */
>> -
>>  static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
>>  {
>>  	struct clk_imx8mp_audiomix_priv *priv = dev_get_drvdata(dev);
>> @@ -408,7 +364,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		goto err_clk_register;
>>  
>> -	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
>> +	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
>>  	if (ret)
>>  		goto err_clk_register;
>>  
>> 
>> -- 
>> 2.45.2
>> 

-- 
Jerome
