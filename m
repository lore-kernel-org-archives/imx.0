Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF6E28C5AB;
	Tue, 10 Jun 2025 10:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550910; cv=none; b=cqLK5NdDFUNm5TIRkGWPgtHPglcuQe9/268VPaCzBN6TcggT/TSGabXkKVJyn4lDs2OJUFQfG/eM+WVc8dHvrycCrgLprMAwfR1Sz3yqQsAM/CYmQIeFnr8lm/p8QDt4NTjxFWQIXs1L20amlzeRoGYisL/rCnCkbM9580YtYvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550910; c=relaxed/simple;
	bh=83dLs1W0SUF6G9on9GAeFmui9zBttsQCPVnOanN018I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nuDN4eOB75XxREiR3ZzWqJGF7lVR25JtJe27vkv+GR7JGXZwl0aFbLiLwu8dmggHMTLGvR2hl0rX7F0upTldc1q9xyEhv5+qZ57kUe2nut0SgzwB8Lw1FVif46Cc9kmucdR5Dv5JLwLvd0JMHPO31TyeNmFKyvexpM5kPNwK1XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8CxNHAyB0hoQZgSAQ--.45546S3;
	Tue, 10 Jun 2025 18:21:38 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMDxOcQoB0hoWTcUAQ--.17S2;
	Tue, 10 Jun 2025 18:21:34 +0800 (CST)
Message-ID: <6ab83033-1349-4d5e-8d1f-8a13d851abf4@loongson.cn>
Date: Tue, 10 Jun 2025 18:21:27 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/35] mmc: sdhci: Use devm_mmc_alloc_host() helper
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen
 <chenhuacai@loongson.cn>, Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Huacai Chen
 <chenhuacai@kernel.org>, linux-mmc@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, Ben Dooks <ben-linux@fluff.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 imx@lists.linux.dev, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org, Aubin Constans
 <aubin.constans@microchip.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Yixun Lan <dlan@gentoo.org>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Hu Ziji <huziji@marvell.com>
References: <cover.1749127796.git.zhoubinbin@loongson.cn>
 <dcfce3ddf980563c590f82c1b4e8840c29497887.1749127796.git.zhoubinbin@loongson.cn>
 <t5caqkvguurw2dwzn7wkbjo5ryv3jp3eppjzhdwgx6q6vro2q2@onqqr6v3whdo>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <t5caqkvguurw2dwzn7wkbjo5ryv3jp3eppjzhdwgx6q6vro2q2@onqqr6v3whdo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMDxOcQoB0hoWTcUAQ--.17S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFWxKr47tF1xXryUXw13Awc_yoW8uw1rpa
	15Za48Cr4UWF45KrZrA3WjkFyvqw40qrWUK34fXw1rZF4jyryqqFZxCFWjvFn8Cr1UKa4I
	vF4kWF15CFy8AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUA529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUeVpB3UUUUU==

Hi Thierry:

On 2025/6/10 17:42, Thierry Reding wrote:
> On Sat, Jun 07, 2025 at 03:33:34PM +0800, Binbin Zhou wrote:
>> Use new function devm_mmc_alloc_host() to simplify the code.
>>
>> Although sdhci_free_host() is no longer needed, to avoid drivers that still
>> use this function from failing to compile, sdhci_free_host() is temporarily
>> set to empty. Finally, it will be removed when there are no more callers.
>>
>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>> ---
>>   drivers/mmc/host/sdhci.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>> index 32fa0b2bb912..ee5a5ae4db31 100644
>> --- a/drivers/mmc/host/sdhci.c
>> +++ b/drivers/mmc/host/sdhci.c
>> @@ -4076,7 +4076,7 @@ struct sdhci_host *sdhci_alloc_host(struct device *dev,
>>   
>>   	WARN_ON(dev == NULL);
>>   
>> -	mmc = mmc_alloc_host(sizeof(struct sdhci_host) + priv_size, dev);
>> +	mmc = devm_mmc_alloc_host(dev, sizeof(struct sdhci_host) + priv_size);
>>   	if (!mmc)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> @@ -5002,7 +5002,6 @@ EXPORT_SYMBOL_GPL(sdhci_remove_host);
>>   
>>   void sdhci_free_host(struct sdhci_host *host)
>>   {
>> -	mmc_free_host(host->mmc);
>>   }
> Is there any point in keeping the sdhci_free_host() function around now?
> I only see patches 1 and 31, so not sure if anything happens in between.

To minimize email delivery failures, I handle each driver patch by 
sending it to the relevant person, while sending patches 0 and 1 to 
everyone.

Keeping sdhci_free_host() as suggested by Adrian[1] is to minimize 
disruption to the compilation process. We first set sdhci_free_host() to 
empty, and once all callers have been cleaned up, we will remove it[2].

Of course, perhaps I should also CC the final patch[2] to everyone, 
which would make the entire process clearer.

[1]: 
https://lore.kernel.org/all/78ffbae6-1c75-46ac-a5d7-bbc07bca1fd0@intel.com/

[2]: 
https://lore.kernel.org/all/8adcfef00fd4bc40f33f5fd42d2e5e73d72e68e4.1749127796.git.zhoubinbin@loongson.cn/


Thanks.
Binbin

>
> Thierry

