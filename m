Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9D21E0DEA
	for <imx@lists.linux.dev>; Mon, 26 May 2025 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247649; cv=none; b=lpTdVS9zWLdghQHH1jBJ4U+fAPDc2yqZY7Oho36rD5fkA0FWt13F9rYLjywFaUojmnZ1Y4NeLuTpgDD/6ElRwKgl5fSSon3NJ2xR04p53mOmSAJrsd0WPLBz3eSohsJi+wf3mwyGf5xvKD6wzcOSO8y8nA3MdZU5QyTHWUA2X5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247649; c=relaxed/simple;
	bh=G0ukDlmCEeiVk4lGJXL6X8znDvQHi0KI0JKSN9xK6CY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=az1ZyScYS4hC1tGArumAY4p0WKcoZh8xHRA2qbrJrajzXAOdZO0bREbOXUYKWpSdsQd9JNHY0GUEzrlmamBUQ2wj9jKn6GKeRdjkt4Wkh29rTW9wMLY5BN7ud3QGN6osLIHqjfoLI+gCyKVxIljBQMGfA56MUg8S0lj0jEcTHvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 50581bc43a0a11f0b29709d653e92f7d-20250526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:c8cffb3b-ca75-422b-af48-838dfab09a5d,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:15,RULE:Release_Ham,ACTI
	ON:release,TS:22
X-CID-INFO: VERSION:1.1.45,REQID:c8cffb3b-ca75-422b-af48-838dfab09a5d,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:15,RULE:Release_Ham,ACTION
	:release,TS:22
X-CID-META: VersionHash:6493067,CLOUDID:3b493ef02f725a96f0d2e58473886bae,BulkI
	D:250522180435BN613KC0,BulkQuantity:5,Recheck:0,SF:19|24|38|45|64|66|72|78
	|80|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:ni
	l,Bulk:40|23,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-UUID: 50581bc43a0a11f0b29709d653e92f7d-20250526
X-User: aichao@kylinos.cn
Received: from [172.25.120.86] [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 784335124; Mon, 26 May 2025 16:20:42 +0800
Message-ID: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
Date: Mon, 26 May 2025 16:20:37 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
To: Johannes Berg <johannes@sipsolutions.net>, perex <perex@perex.cz>,
 tiwai <tiwai@suse.com>,
 "kuninori.morimoto.gx" <kuninori.morimoto.gx@renesas.com>,
 lgirdwood <lgirdwood@gmail.com>, broonie <broonie@kernel.org>,
 jbrunet <jbrunet@baylibre.com>, "neil.armstrong"
 <neil.armstrong@linaro.org>, khilman <khilman@baylibre.com>,
 "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
 "shengjiu.wang" <shengjiu.wang@gmail.com>, "Xiubo.Lee"
 <Xiubo.Lee@gmail.com>, festevam <festevam@gmail.com>,
 nicoleotsuka <nicoleotsuka@gmail.com>, shawnguo <shawnguo@kernel.org>,
 "s.hauer" <s.hauer@pengutronix.de>,
 "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>
Cc: linux-sound <linux-sound@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>, imx
 <imx@lists.linux.dev>, kernel <kernel@pengutronix.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
Content-Language: en-US
From: Ai Chao <aichao@kylinos.cn>
In-Reply-To: <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Johannes:
>> Hi Johannes:
>>
>>>> "simplifies the code" is no need to callof_node_put() .
>>> Fair. Except that's not what you _actually_ changed here. Like I said,
>>> either it's buggy before or after.
>>>
>> In the function i2sbus_probe, it not return a struct device_node, so , I
>> think function for_each_child_of_node_scoped is better than
>> for_each_child_of_node.
> You still haven't explained why it's even correct.
>
> johannes

The for_each_child_of_node() function is used to iterate over all child 
nodes of a device tree node.
During each iteration, it retrieves a pointer to the child node via 
of_get_next_child() and automatically increments the node's reference 
count (of_node_get()).
Each call to of_get_next_child() increases the reference count 
(refcount) of the returned child node, ensuring that the node is not 
freed while in use.
for_each_child_of_node() increments the child node's reference count in 
each iteration but does not decrement it automatically.
If of_node_put() is not called manually, the reference count will never 
reach zero, resulting in a memory leak of the node.

Best regards,
Ai Chao
