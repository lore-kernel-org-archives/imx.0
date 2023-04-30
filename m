Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9E32F5F
	for <imx@lists.linux.dev>; Sun, 30 Apr 2023 17:56:25 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id tAoLpfGTXV1EUtAoLpsODA; Sun, 30 Apr 2023 19:26:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1682875572;
	bh=Ff9zLIel8IkcYw54eNME8HFBBN/fErD49ahKsmeOXpk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YN8IWWnZR20YHKSoKyGtLlVnpeVWliXD1bnewgdefXmWjpFtNrIXM7QLFcY3zp+fQ
	 2wOFv94Mhf82yEqo3wwGsF8yiMhvHuJcq+WsFpqfqSM5T3XCA6SfQirCK04+kTDT/N
	 KHMq7HgHiWA3dpFrF3RSip2YHKvQabDu41HqwMA6PiOB1sBQo0gc2L1AP4F73XQlCJ
	 NesSxS0QLda6jGOJTIZcPdRhXNTQtRgzyXfCHGyDiD8zwctzOv1WXTZdAiLd7Gk2in
	 MBsOA4ukU9cnwXCmuWBGCumQyZmrVksDCXYwz4c2k6uF4pgv2fGs++NYopcf0kVhfu
	 7CghrtJiRaKjA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 30 Apr 2023 19:26:12 +0200
X-ME-IP: 86.243.2.178
Message-ID: <2d11fffd-efa5-9922-fd89-9e7246195f66@wanadoo.fr>
Date: Sun, 30 Apr 2023 19:26:09 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] iio: light: vcnl4035: fixed chip ID check
Content-Language: fr, en-AU
To: Frank Li <Frank.Li@nxp.com>
Cc: andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
 imx@lists.linux.dev, jdelvare@suse.de, jic23@kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, petrm@nvidia.com,
 pn@denx.de, u.kleine-koenig@pengutronix.de
References: <20230427213038.1375404-1-Frank.Li@nxp.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230427213038.1375404-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 27/04/2023 à 23:30, Frank Li a écrit :
> VCNL4035 register(0xE) ID_L and ID_M define as:
> 
>   ID_L: 0x80
>   ID_H: 7:6 (0:0)
>         5:4 (0:0) slave address = 0x60 (7-bit)
>             (0:1) slave address = 0x51 (7-bit)
>             (1:0) slave address = 0x40 (7-bit)
>             (1:0) slave address = 0x41 (7-bit)
>         3:0 Version code default	(0:0:0:0)
> 
> So just check ID_L.
> 
> Fixes: 55707294c4eb ("iio: light: Add support for vishay vcnl4035")
> 
> Signed-off-by: Frank Li <Frank.Li-3arQi8VN3Tc@public.gmane.org>
> ---
>   drivers/iio/light/vcnl4035.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/light/vcnl4035.c b/drivers/iio/light/vcnl4035.c
> index 3ed37f6057fb..8b7769930f3b 100644
> --- a/drivers/iio/light/vcnl4035.c
> +++ b/drivers/iio/light/vcnl4035.c
> @@ -413,7 +413,7 @@ static int vcnl4035_init(struct vcnl4035_data *data)
>   		return ret;
>   	}
>   
> -	if (id != VCNL4035_DEV_ID_VAL) {
> +	if ((id & 0xff) != VCNL4035_DEV_ID_VAL) {
>   		dev_err(&data->client->dev, "Wrong id, got %x, expected %x\n",
>   			id, VCNL4035_DEV_ID_VAL);

Hi,
should the error message be updated as well?

Cj

>   		return -ENODEV;

