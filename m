Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE2815B5
	for <imx@lists.linux.dev>; Sun,  9 Jul 2023 08:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688891423; x=1689496223; i=markus.elfring@web.de;
 bh=E50qoiXbl4BQAlrBuHm+TafJOBOa0lGfmm8vrH65Xro=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=SuGy1PZ3JiJKtp+W/5IUHyVU3C4hlVCGgoAQczRn4EJna+8FVTqmJAZaV/yA9va1PN+JEcU
 b/ApM6elNJCKIr1NcTxWFqxNcSgjwKlrknwwInyc6sBxZPobOS8et2/YF+xZowHWLVUXuE+fI
 E5GnV1MNIdc3xDSNNQ77OwAvw3Z/eBlXJqW25xky8bUYbPatt27CZWWLRtapkmV1CaANtNjie
 RkXvNzAOuchKAuT3D57EQ5WBRMrjqoXHJZ3pT1veViaJRUvf4has1Itgx1zDLSZtcckEkdI/v
 zKHXXhiHgWavjtd4cSDze3doUtrWaaCcmvKtAczdx5aQHvBk/qmQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MKMA7-1qYaRc0NSh-00LUBF; Sun, 09
 Jul 2023 10:30:23 +0200
Message-ID: <f2f29489-19ae-0fbf-b3a6-d528a5acbefc@web.de>
Date: Sun, 9 Jul 2023 10:30:21 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v2 2/2] usb: cdns3: fix incorrect calculation of ep_buf_size
 when more than one config
Content-Language: en-GB
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Elson Roy Serrao <quic_eserrao@quicinc.com>,
 =?UTF-8?B?SsOzIMOBZ2lsYSBCaXRzY2g=?= <jgilab@gmail.com>,
 Jun Li <jun.li@nxp.com>, Peter Chen <peter.chen@kernel.org>,
 Prashanth K <quic_prashk@quicinc.com>,
 Ravi Gunasekaran <r-gunasekaran@ti.com>, Roger Quadros <rogerq@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Sasha Levin <sashal@kernel.org>
References: <20230707230015.494999-2-Frank.Li@nxp.com>
 <f803653c-8967-b187-8339-fbec0cdeef25@web.de>
 <2023070924-uncolored-bootleg-77d6@gregkh>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2023070924-uncolored-bootleg-77d6@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p/tD8QteR6FlB4NWezjTU/8ofq6koWmAWi+0PwSCPrzv24Z4zRr
 GW4w6UJ5DLK36jrwUCMGuZZ8KqGYKWf9hLnjg2SDZ73dpwXy6mqeA0AevY4WrgX4HhnDvmn
 6KM8Z2u6l7iR7ZU/KdFyd3lGbuyl3I4LD+HEd9Wj7vWO4jKLTH+S2mnNwCyb1NwZ8nb2Ldl
 FyflpqPURA60UbdA+hliA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8W3MPxZLilY=;eKDYDLlyMSQuRXGWFuj+WgV9fF5
 VZPxJUzr+brjuyvDQxLSptppcNik1q0w/+d4qn2JNlzjN8EbMEdXVhA+eG1ijsDpuUkxsyyTM
 Q0Z6//SQPpv+EZGeNExaCkYuN7+wfq1SAd4vI+VP86P1rQFKDwMRfwdqm7A0Mvv+L8uv/v+JC
 +GDVZ1vTSGqCXH51czNQuFh1xUW+of1brVKzfVn7Ln8bAKxC7Lvmi3z7IwZ8lv2BYdMW1P7DC
 bfz+4H8/L+JMyUcdcwHXwqMFs2WnO6opD2OvJgaY/uDgkVCbgDoR7RaFvAh7Ufa1n7s2tSRnQ
 6MR9eJpqNA5oFaV36yTXrrjwZUHkUmTbBsj9UuDwHJJQFRtH6JQ8yUas+cQmOS9bWgDO64VrK
 aTiOgvXxsiEdovfI7qYUx0qAdBG9jst7Qo6QZcMPGtsRwu1QFzJEH5/MNEopoQf/7d0eDzEIy
 RxBnBwron9LesvV35Wbt46MIXBdaruZFpcfOagrdXn4LzJFMQmhCOihFPFHYUJ2FU4KMM9Y/S
 rAjPC4jN0zncjHtfWyMUN2vYBmUAUndLlLNkC1BMadn5YG+k2lpA94PwSWt/DzkH321Ecp8Kn
 TIMM5wdtOn+bBKD8sKg/1eqEBSkhx/eNzobfp6Em+ZOPT4hZvs4jPC5LFBQMAHM9km7KoUwfj
 POvks1b0cLW/ost902BORu1XRvvYPRKhYuogSj2vjgHTUHwtLkDKc7/XYpWvh2shtGZnmmE2K
 yxLI0ETo/h9pcR/6xVQWWsgYx+oGM8KGmw/Z52/vUxI35ob+rhyMjWzIk4q16n6Io8YoMRis1
 UQ229//69W3bBw8kIUR97/cbGboULbWxYNUkt1uQPcs30lVWAhUtYOyz54WgydWe0Iwqfbpy4
 kRRVEcSGPdfEXaThbtI5KlRoTx6emejjyRwUORLt9XGifdJCiQkSx45gGUpDkmAfOWtQ46ve0
 qcyzdw==

>> =E2=80=A6
>>> The fix involves checking the private flags EP_CLAIMED instead of rely=
ing
>>> on the "claimed" flag.
>> =E2=80=A6
>>
>> Please choose an imperative change suggestion.
>
> Please do not review USB kernel patches, the comments you make are not
> helpful for developers and will be ignored.

Does such a response really indicate that you a reject a known advice
from the Linux development documentation?

Do you like the same patch reviews more by other contributors?


By the way:
Further change suggestions (including patches) from my selection are still=
 waiting on
more positive and constructive feedback.

Regards,
Markus
