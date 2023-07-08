Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C795F53B5
	for <imx@lists.linux.dev>; Sat,  8 Jul 2023 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688829520; x=1689434320; i=markus.elfring@web.de;
 bh=9xw4bt+vRer1ZaDtVRHedy/jW9Evg+gCqMh1dj1ypUI=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=thSAnI99pZ1gx55rEUn1tp82bJSbwjjBzJfnihpUpi6t0tKOvyXFzSLlq8zmxfO0RhaBMgT
 8c2YIBo3/fgxt1oqtbK8s401XTAcmFpQ0TlJrt0z2j4XzDnsta8v1mn0RwzaJ6it2/PA6s3C6
 5oRDspgFYYqHsSDlx50AQ35BcgBR63PLRa8N5SGzmnq34vi65S9y7i2B5GeqjcTJX5GPmcGNa
 JXdADtp/HQXLYlKI4JbFfACUVOrqbGMcTvAQ04fGwHv26qljX2IE+uy/WyFqJtiBGQ6phnBz1
 CkpNiUVlVM7FikSdLZxbB3rk+arRY/Z056fmEAg82gQ3lXG/IPUw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mv3US-1q0cr13vSi-00rFvq; Sat, 08
 Jul 2023 17:18:40 +0200
Message-ID: <f803653c-8967-b187-8339-fbec0cdeef25@web.de>
Date: Sat, 8 Jul 2023 17:18:38 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Frank Li <Frank.Li@nxp.com>, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, imx@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Elson Roy Serrao <quic_eserrao@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?B?SsOzIMOBZ2lsYSBCaXRzY2g=?= <jgilab@gmail.com>,
 Jun Li <jun.li@nxp.com>, Peter Chen <peter.chen@kernel.org>,
 Prashanth K <quic_prashk@quicinc.com>,
 Ravi Gunasekaran <r-gunasekaran@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20230707230015.494999-2-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 2/2] usb: cdns3: fix incorrect calculation of
 ep_buf_size when more than one config
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230707230015.494999-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k0RzQ0kzPOXtfKdMaShGYVkb2af8ecGx1QqXyepxOtF5Kv2bG9r
 szievDgC/UQTraYhrT8c98spj6VFnpWn1VOicWhtZMlLaKCaqIh6hGCht0V9v2mkCd6daAK
 i2PI0VOkOipKOsofuSlCoa57Y2yuclcu+fxJPnTxdGml/TlWQ15uesdNI7PmckDeNshb5rS
 QmkRz8ctZSwG83dNop9ZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iPFq2PyAnRQ=;LbmgHbkkBXiJgvOJaLE7YN5TaYF
 LzRnQ9jlNikJwI4zwIeT/byXEsYulmFxrBi9/0/pKNIw0DCBDT+oDHvkdxldh/11zqqyOujJ6
 UFIDkTj6BQoArJWiaUKe48zgfeQsWEjKv5DsZBqZfnCttKgOVIJcP2OpkQkgJ6+PIo9p4QtP3
 Z0PVT6F85qCF33kgcdu5Y4eccfMIu6y7jgixdsVqp7uSdi++GJ90v8Dm6SWiRiinL2cN8RBtU
 Fad+wpU3fbREnE3zybBZ/cCHQZGjYeVsMuXGpBHybSiRhASJUMkOLsK04LzVCBj7oCaZHL1Uh
 lZVE2uu/vczSeXarEzgItBweZnrnJjCxjmNoUoSgyGPWfknJzS0i0xjiXikwbKTONeZyOxm+B
 nJ16Ik1TWDIX7ffUO6Nf0l29pzryZoD5uf1BZVnMr9DJMLxY6GqBqMnGzMhZyQxbKdwEF9WDc
 ArCVlqZmfoiAq0y/ybFXBcAlKxIr9MeaYMWDUiQQcG3IUDEA7AAjworxTo8vL7I1fLSparlRq
 cqLFdJhChDl0rrGz0j2Vh6LBQUXx+HKnIOxkzxLeIgWDKUKI95GXaRWOuEfhFr976zEfyLGix
 8+3ZWZsAle8pN9SHHML1BvM8UBvcl/ubNNcSMmyvLZqyrnOfF9ZjX/C2W/DGhHRBCXsOv6EMe
 t/3a956ANiw7BtKfsyFkU5hp5dDF6y2N7jd+hX/JVZ+F5zUE/cGiidCjKQrUtqAM7Af7290W5
 MeKGukX9xMbFpcX2G4xJnPJsGoEXQnQIonZVQxzMMAFsHeaZNtn78KFhjtWhClAzb3CDlCaGY
 Kh3X8UhLX0ss3QlDHoRfk0dnGoCk6iEwlJKvjBJM+TFlu5WkW2mtRq0foeA2j+LPkbAeZfmbt
 1Z0JOXxghW3k32bwey+lrizvhHPQz21FN/WZm6HqlgfbVC6exil00FTjXKX9TGLavnsTXhBs4
 6WGRZw==

=E2=80=A6
> The fix involves checking the private flags EP_CLAIMED instead of relyin=
g
> on the "claimed" flag.
=E2=80=A6

Please choose an imperative change suggestion.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4#n94


Will a cover letter become helpful also for the presented small patch seri=
es?

Regards,
Markus
