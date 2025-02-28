Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DE11BC099
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 06:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740722452; cv=none; b=BGNz9YmcVqj/NlAW2pze0SI8fufADyndgGaa7jT2TYhUbFtJlwIW0rZqdubOj9ye+2AfJVXNfGJyIbrsGPoxW6Oep3MTW+irX889UYYvZn7NJOwKkExab5UVS25L3YqBaQB4lJ+VikWVF2xxGyi3wZHTsrrwzLfSLRkX9yuFyy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740722452; c=relaxed/simple;
	bh=twi/yzpdXsZjs7Pe1CdQSGFbeIRq05yQQFooB/+9mvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=j1YzfFnaJ+eBNgkaHqdPEwk5hxFYcgHKxkak9fJlyLG/fp7sIVFOUiyzbPrrOtY0dHUFBrTknOAaOeSmrN7f6trMj2pw68Baxea1dAjjN2Vxbveb7Ry9P64Y6AWCnnumdjUix9euQhnAqUDNQCQJKppzqcnHJZuZKDmbKQ+qlJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTqM+Eyw; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTqM+Eyw"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86b2cc5b3c4so692276241.3
        for <imx@lists.linux.dev>; Thu, 27 Feb 2025 22:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740722450; x=1741327250; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llT+ginst054rhLhA6/yosLb6bykmkgNldbu3QbBuo4=;
        b=BTqM+Eyw8/cUP0M46kUD0CUhspYgpJazokOHR75LZ0s3J3Le2w43Q6IHlNWc0NPO8j
         KBKQLsHDx5w7kb2Mzd+86nAT4uDDQ4FyFiU/pJJ8DZSLnAp6jvxVagHywDSYQ6c/G94f
         cwDinNca5Br3kyV2yaJDScGfvEaPuF9sdTQjSHNzSJJiE+xcd4IysMxxNpR68tUGa0Xj
         zZcMGQEL4fuTMeNwffBSPpa/b+MFIlRZyJOB7WO3dt1XkG5WdgLzYfZNcbt2ECGpWCAy
         oBnZJdMytm2kNAvqj97wyqwZRlt1Y8VKRp09P1s7awvTQYedh7Qxh6rIqcXHA0b6yppe
         7KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740722450; x=1741327250;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llT+ginst054rhLhA6/yosLb6bykmkgNldbu3QbBuo4=;
        b=gnQ1oYcwaL8pSr/IBmH5rYuAaD46Hg+DryTRJvl25VAEY3sYhxVjngQ0T+px7DM6iK
         x6r27nQz6sYWXWkpHOA9QwaQUCr/FtuU1l8rO4StFWWwCkFdV0yWh5DKmPAM6IpriTK+
         HccSFvbQVPN/FapDE4jrog8XJqno1ldG8lnKLgs/xsd1LIBzJlbgOkJqrHwTvqWAOXqK
         wLuISNpA6UUH5Nm00K5OSyE0vUM/Qvr8Nn9XJrq/HaXKAX/DTWjllB9eGtPexktPOAjg
         krobNwd0NVL6K5KD6CrTu8E7lXdYAZ3oxTO6Cq6CUOOY1xg53Xb4dp4TEyaElFeefAdg
         z/AA==
X-Gm-Message-State: AOJu0Yxdv0mfR/2ALCC/6MF7RgUZjNlFn6QJuIpCtecPbhdVP5ALpDV9
	UDsxz82y8YbwOLC81Qhvtu18Oskchywa5A8b5PN2dluRTXPenKY4HbegRpFdH4fjAamHsnlJPPG
	KEanJgFVpcGmWq4pAEwsR91BtRt+fBQ==
X-Gm-Gg: ASbGncue9Z4uHW1MdyNR47c0eUSFR+m3zRRRTP7bM+Xl04ikvxiLIOZa42crvfYtOUx
	rXNUgCZaWw0xczb79men8CCTea852vfa9buoD5uz3UGrxW5NVA7QjHqQ9az/m2DsUYMZEFuGef9
	v5apHyuBnnZcmms+Y7qyeGzgF4RmiAsofR1mFsgfE=
X-Google-Smtp-Source: AGHT+IEw3bOzxz+D4RRtXdGLVVCwq4xoxXyDIF4NB0Jj9uEuWuXKI6wXo8OwXwzRYdzY3dnSkRyPaa+qCyosS6Apfys=
X-Received: by 2002:a05:6102:1485:b0:4bb:ecb9:b34d with SMTP id
 ada2fe7eead31-4c044eda3b5mr1797529137.18.1740722449741; Thu, 27 Feb 2025
 22:00:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD-cv=PxghRoD12wiJL0=e30OMqT0S-Wbw-yt-ubVP45F-tz6g@mail.gmail.com>
In-Reply-To: <CAD-cv=PxghRoD12wiJL0=e30OMqT0S-Wbw-yt-ubVP45F-tz6g@mail.gmail.com>
From: Andrea Tessadri <tessadriandrea@gmail.com>
Date: Fri, 28 Feb 2025 07:00:40 +0100
X-Gm-Features: AQ5f1JoJpvY2GAXSA9MrcbqgtJzLxFpD9LvqWun8N0BYf_HshljWMHboV9xC77o
Message-ID: <CAD-cv=PqGB455jgVunJQ5x0brGyG9zz6NJaBt+7Qd+3UpY0eug@mail.gmail.com>
Subject: Fwd: Adding circular buffer capability to spi-imx.c
To: imx@lists.linux.dev, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,
   I work with a IMX8 PLUS EVK and I need to receive a high rate data
flow via SPI from a real-time external microcontroller clocked by an
ADC capture.

My idea was to extend the spi-imx.c driver to add capability to use
dma_prep_cyclic with iMX8 powerful SDMA.

So, in this case Linux will be spi slave (the real time micro is
master) but I wouldn't like to use PIO mode since I can control spi
master to send data 4 bytes aligned to fit DMA alignment requirements.

I am stuck with implementation:
1) to change transfer_one is not the good way because I don't need
pump messages from SPI subsystem, I just need DMA doing the job and to
follow the transfer with a callback triggered by SDMA part every
"period len"

2) to add the transfer function (deprecated) to use spi_async is a
possibility but I don't know how to pass the period len info: if I
consider to pass a message with several transfers I have to check that
every buffer in a transfer has the same size

3) to use transfer function with a spi message and several transfers
(one for each period of a circular buffer) prevents me to use
dma_prep_cyclic that works on a single buffer (then descriptors inside
dma_prep_cyclic will split the buffer in N periods)

Should I go for using setup and cleanup that are now empty ?
In this case I can consider:
A) with setup I can pass into spi_device the information about a
circular buffer allocated by a protocol driver and also I can add a
callback to be triggered by DMA
B) with cleanup I could stop the DMA transfer when needed

Anyway, setup and cleanup shouldn't start or stop the spi transfer and
this is why I am puzzling to get the proper solution.

Thank you in advance

  Andrea Tessadri
  (Italy)
