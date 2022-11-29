Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E17F808
	for <imx@lists.linux.dev>; Tue, 29 Nov 2022 18:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=zrPLVXc1wxhnRG45/ElMpwAglQX6PxOgC3lXR1KUK+k=; b=dFI0SyaARzE1Q3N7p5DCgkrJXG
	I/X6+e1ncC7HlpKCT0CIr4UJDnjdCuu+lUNnL/c0z6blwqsHwWrU/qIRaN+n3Wk1RvVimGH/0q0Nd
	/zMONw7GaKI4ZMgL+wQP/8OcOB3aMFMTeLKDeExQrXvKcudOoY607zR5zLMvS/Wxb2pRRuxv0KWP1
	a6SqwmW09pz+ti8pid+HEe7pWacx0QZzH05w9I1RO5tBsKeT8LecUOuv3MrpMsBByePI6QEcE8pcA
	722HJpJNq1MJZyvbMbjuLR9znCMpb9VAS2PM00yeTogBj16/+frwrjt3yNwiUOo/dsIHvIS46Ep4W
	zmQQITMQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lars@metafoo.de>)
	id 1p05G9-000JbQ-5z; Tue, 29 Nov 2022 19:23:09 +0100
Received: from [136.25.87.181] (helo=[192.168.86.22])
	by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <lars@metafoo.de>)
	id 1p05G8-0001eX-Ju; Tue, 29 Nov 2022 19:23:08 +0100
Message-ID: <bbacb73a-6904-d196-ab4a-3e388bcab56c@metafoo.de>
Date: Tue, 29 Nov 2022 10:23:04 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/1] iio: imx8qxp-adc: fix irq flood when call
 imx8qxp_adc_read_raw()
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, Cai Huoqing <cai.huoqing@linux.dev>,
 Haibo Chen <haibo.chen@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 "open list:NXP i.MX 8QXP ADC DRIVER" <linux-iio@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20221129164531.2164660-1-Frank.Li@nxp.com>
From: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <20221129164531.2164660-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26735/Tue Nov 29 09:18:47 2022)

On 11/29/22 08:45, Frank Li wrote:
		       readl(adc->regs + IMX8QXP_ADR_ADC_FCTRL));
> @@ -272,6 +275,10 @@ static irqreturn_t imx8qxp_adc_isr(int irq, void *dev_id)
>   	if (fifo_count)
>   		complete(&adc->completion);

Shouldn't the completion be triggered after the reading of the samples? 
otherwise you have a race condition on a multi-processor system.

>   
> +	for (i = 0; i < fifo_count; i++)
> +		adc->fifo[i] = FIELD_GET(IMX8QXP_ADC_RESFIFO_VAL_MASK,
> +				readl_relaxed(adc->regs + IMX8QXP_ADR_ADC_RESFIFO));
> +
>   	return IRQ_HANDLED;
>   }
>   

