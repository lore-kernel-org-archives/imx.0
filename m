Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DB2275B5
	for <imx@lists.linux.dev>; Wed, 19 Jul 2023 19:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689794857; x=1690399657; i=markus.elfring@web.de;
 bh=tOOVF5RkiOgi7PvT8eFAGuSeS37l7RghBPvO4WGeMrQ=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=I3Uy6DwhqZLS5DB18htbg90sk2Srs+M55ebjqQsLiFODdInnfUMSnaNi74sszFQfW+z2x7B
 9+D38/27rZDSbA2VviWPSH9WzhFvjG5kV7f/LAd4qH9NkTmdRksQxBhTq4NczAwEJaOo0AGnT
 kSzzczaknfq9hlf7kpgpDTkLgXNDIAAxS1AMBBJ6MEu5e43yVG6sG9/7aPq8C/LdjyDJ/9zs5
 euImndX2PKTlbgWqJ9H0E3+TCvAiN6G10VrywcVFngzi7/zJEAtep/Sjf4GB8Lueslok/vqc2
 3/gz5u9ZVa0M++veO3mN0NxLeqAWDpNKH3cnLa7syjh69Jd2HpPQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MXoYS-1qPWEP2o7I-00YF8K; Wed, 19
 Jul 2023 21:27:37 +0200
Message-ID: <901fdc6a-a560-a431-adc9-aa73d7f69e7a@web.de>
Date: Wed, 19 Jul 2023 21:27:23 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] PCI: layerscape: Add support for Link down
 notification
To: Frank Li <Frank.Li@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Xiaowei Bao <xiaowei.bao@nxp.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
 <kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Rob Herring <robh@kernel.org>, Roy Zang <roy.zang@nxp.com>
References: <20230719155707.1948698-1-Frank.Li@nxp.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230719155707.1948698-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y4xC58aU4AA7rTGeebv3Bmu6UO4ApCIAz2t4ZBBDpZgJEp6h4mi
 G1eeFrDKdw3d0304bhQPWwvlKSnIMmF6mUY0oMFMLXezizyJ2BP0h+zAsfUg34K7Wz8IgmJ
 NkPjMJswSONNozT9ZzVs8xL30PrCf/f/gzf1QsDxqMLGu6i6INCs6S9xspfGkQBBbivgJ8i
 kR0yApk2KrTJ37quN0iPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/CVLspWjoKc=;K00rwHyed+MI3jRcrdfpmh8I5cx
 +Zzz5c9cRHrT8f7ZzndlJvOyllzB58aNWSzuYUcdbIkTSWSsjgygpngaaOGryvPLrpYXHCuQl
 MoL7D5ShXv3v+4QQ5c/pZgDd0j3nYXmqLOyadJ5q0WYLlgPA3QS8zgaFlS6eKIvvsRzD3ur1B
 +YdCbPJiL7/KlsKVQPedELa6GaWOW/8iHrUec7fBqk/MoMvWeJZMfVhjlY/1RVLr+lfL0ZZkn
 2LFJrwhQSP6diubEU8jImP1LtA93Epk3rh0/w2UUlPBeORtpsK657VTacFbo2KYpobqbu0j99
 ckF4R5iVzSLsNJv1rxUPCuy0/YXL0taQmvIewm6/eAdtMJsrZMjFCSGqSLjUbRAQL925dHVNI
 iZTQKJV2j6Xnv/RMAOecd33G4FbX/9sw0/Db73fXMeTOgN89im9rOsBHybp/Zgsz5o283Max2
 25RBhLpYgp0PeMg2PfZ4SjcR799iEta4gqDywJyjgmhgwY/Z4uS36F4ekBPpJEuY3duFBHNtY
 2W3IXGCQkvTAHGWd9FLhZhb29hHwFsgkqJOaOPGeseFWkFU3Eth+OC70ov2qQ8CSMkUMuGEqS
 HKUYocePB5U0FmCyLm6BWgTcyvKy0d5UcuheDNKathkZ+1yLTlWGZzu3NxRzPxcjQV4yzcq/q
 mX064ok2S2e7G+IEbKJVtzRYj9Rn0r6oE2w9yhHlc/Ppbo+4fof+EM1OD3wVdE2mPzsyOZDU+
 Pkk6XnIrc1OK7ufrrlK33C6e983MrAaUw4EyPw6q62a+UhffRumjDQllWgqyA/eGWx2HBj1/W
 8WGnQFJ5KM4PVatLak1CkQ9TNqu8PIgT/6+HtmaDMsMo15NtzTmIgwmhcY76Sadl/4/ncAwmR
 Morxal0ZQcbG4zLpDg+Z2vCK6db0yqqzKWsKcQJxeu9oDjt+FB56MIqTSsexhKyMMRhYwWYoI
 1gmYSQ==

> Add support to pass =E2=80=A6

Why did you omit a cover letter for the discussed patch series once more?

Do you care for consequences according to message threading?

Regards,
Markus
