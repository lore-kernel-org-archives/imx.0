Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6012C1598
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385701; cv=none; b=uo/3ip1BqL6L94dD3ml+/44vBaWlxHoCnuLLD1ZSW0qfPF6FWGk+rBDu1zSQZxwSWwlKXCSvtmGXn9oAllE0njgYCMGRIPIGKVmbSIMx3vySGDsfvpBgHboFwH9S8ij59gIiVC033avC08HIxxsILyWGby8IxKIS8qy96YMb41M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385701; c=relaxed/simple;
	bh=e8MY+EqhN2Bw1t1vOGzCgEmWAD0c9+fT2885jbPp00g=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=pPzCuUzdkfbNE4c/pUCHtZALSv7wUH26N0X6KcydF2ndigJ+UhTOQRI5T3JciwKxip/NhCu5BsXPUIWpDBunYznN2bi7vj2Rr84WzV6S+p478Z0+/a5aXknM43MTemvwbJ+eiqotD5lM1aELhcWPjI9EmLBjKt0ftYzh774NZgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fqp97BQV; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fqp97BQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1770385696; x=1770990496; i=markus.elfring@web.de;
	bh=e8MY+EqhN2Bw1t1vOGzCgEmWAD0c9+fT2885jbPp00g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fqp97BQVPaw/PBdmSHX46yjrKiMtRCnHM6QcVUrBh2bTLyWmZHSKjUYOLKropXOO
	 kwkxCCC/Y+9b7Vo2WIRa5+GZ7iXnFYrcxGZcxfkt396CyQbi8bisowz4Jk6OTQmkC
	 nAnaNp6wLh4j2im+AbL/t1KnLiTyYkh7zPApo4mmEo+YB4yRjdjBCgvCM2SBGH0rU
	 6oR9l291leAQHYwlt40hVrV4qQiY890/u7hfYfIgGFVnzVlSYRMBNp06koD2RaY2M
	 Qp/bXlJ7eNaKuqeaqRg4gO6mEDY7oI3nCd0q9u1O0yXBklkWmPNDPKw3eL605gPdX
	 hgVp+GZsDV4rL5yp/w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.223]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N8n4G-1vj9mA28vO-00y6O1; Fri, 06
 Feb 2026 14:48:16 +0100
Message-ID: <31cfdcce-a854-43e0-8ccd-d02632b1049f@web.de>
Date: Fri, 6 Feb 2026 14:48:15 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, imx@lists.linux.dev, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260206050109.119348-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH v2] reset: imx7: Check return value of regmap_attach_dev()
 in imx7_reset_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260206050109.119348-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O3bcp74GbwJBYrm3gLjNXJili4PMRPDN+JK7Py51oBRkoocmLr1
 8q489CNaQdMWhqYKG0Jxu6yKEWagglnl7WAA2y2g6Fhsw6Um2i2PIJHSp5r0kLsxnmWLlIq
 4bAgmh/g3nxES79+VkrkT9Nmbhquh7GMDJAEJ6nTZiJ+HpSNBnQzSBILtb0Va51caDdDm6O
 Pz9dJ8ZkBrUQ9qxKBJwRg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+yjn8JXxH/Y=;RKUxj+uyCTJeXBrT9bTFtcjXyec
 bDcs+YJgTlsddhl4/1sk3mveCw+78wQL/GjdctxYwX/lapPoIbEV+UX8Mr2Rl8Y4O6D+omI85
 6XSSWZLeNuTBHW0r08idIJunZPPurpKQV216h0v/KsA2vvTKwh2qhWpyIY1d0pAEZgmhgOM8k
 bVxk+UhiODhfY9MbwzdrYaXIR+2Fgcx1aqaj31xg+YrjuZ7CO9o12yjPXVEukwL8Fv7A3AzdI
 JOA+LK1zbrDqDo5wSbkGMVpkWHP7dx/zRXzPt9u952qAp5BW/2r/83etisJwXAXGAV5g3WjSl
 gnm6OS1GD1c17w08YptcdCksL7I5YPPE8ytvEADSFJZCzSPrm1lp64haocdciL+JTj9K+Bisp
 AFCEMqXhqEvbo0Oo2uSKR3+KFI5O5Kv33/tpHAUsM7SG8dP0+Suy2q4osSBp5mbHlIyVUX/6+
 SgXggMvWwSmUdLDRorMHHtzkhFm1SLm1YXwWWYgIAWbsyvMqJGEAg7iB8HPoiRpEk8RL5gSyd
 uEvgrdxIa54EHo1J34ibDGDgZjn2S7FN4IYnHWg2QmrgpmWdwl9W/696jqh4iFQ6kfZGlgZZz
 7NnbeZFSR/kPO0GpL4Dd7/ybiaKYJiSWzFdciwTl7a/2aiQcHk3LWDLh3oCASo4rYLX3LCBwQ
 BUCjhrQpv++tENH2kvVeGb7B5KCvq+bRdaLQXirQoXv/dhJtFt44hb6mUduwBdKvneWLZ3X/e
 e3l1bmBrywBWJ2Zq3zzvatxrTbz7q4oM8In9lRyYpkXEmaGhf6UsZRBe6WVRknEV0lebfGwme
 EPcy9XUD9j9I1IHoK0rb2eIUlTu4XXQqOUFzASJfyH7ItMWtkr47hpC/lpjY2xgTg1pDO9J7W
 1zrk9Nfww/2mWJr1WNNqUfToikqOSWeVL7onZHH7ZCOdigQXnl4M+ZVkjuk7MVZudEYsSEyJU
 GJIoTII49yVrROcfMJihz86lM7ShG0Pyj5S4n2t8FS0q2nBmEHEOiStt/sAgyj8zmxhmzEbVm
 xYG4ltb7x7nGjkV9THHj9dsdTmzMjvAIkIDhKVwuYJ0aLp0IpUSa/GDaCYQ1OR+5U51AafYp/
 5Xxs5wQjUhcf+duqiesRzHE9chLk7qoy0eicR+73PRDMCWXFvEkI1x0bp4Dmy1PP5Y4RyJ6Lv
 tUcWQUXA8sNVsVCOBVGJlt9sN0pBweTlklPWMT4wvhWIaOyE15vbtdOKU2YMQCM3CCZhqNn3A
 Q1JuT+4pVxug+NeO1yom+3gGqMrZvMCHZqkZZdcCOIrLjR7FX6hS5HORwbX/jLk3l8o8WwP3k
 6Gz3CdftJ1tFZmwKpFzmL8NKw2vI3x6H44JEXzxv+4DVPWcFy2mlGH5ApJhgWzGXyiRcqwWWb
 TbgR5t+b/863OliRVEk9yCTxCgbX5LT/Z021lXi+Xy9e4tp+Tolmv8HDmNieC9wCu99PFyK14
 WSfKOOpwrUb73bSTx8e5jGct/wDZI72FYTeaswvwtGWNqMgZxrziQkQ3/Q7NclCU08DLMm/WW
 dKFaq+ITdjhCnkEonti6c2cWuu1YTn2MHmC+cra+CMDDjBrE1rh0vDPSR4rO168NSNtTJoVZZ
 /W47nxOv/arFBGqWkMyDWMFopQzStCnsQ5pKypxINjy3TUBtTkvRNplsPKsrT8wWV8HCqBc+b
 EDnJU5CYQdWwxL51MYH1tgNnqBafa/2sDhKS59CkGTbjQiddZaSbvcB3MvQbTFuM9UPpaDh5c
 eakiw3bdo25CtNIIG+b8CUpP5aNa9/o0+ieW94iNkuAHSBL/ry+Sd9j9EJfFxB7Qr9f1aXrA5
 0rPjwgEkp5FP2YLMPGEFAwH9lyr3pLOVzNTmmhzHsfGb4+K7Xmhf6fSaMv0sVitZMk4p5PSnb
 PTLrHhSg3aMxaaslS6YT2FP0v55kE45Lp7ZQbNS8ZjDlzUKQ4u1k1Nf0KiSqM2iN8aPFRnShU
 3OEINzOrYePX94VZKKqYACMbE1+uukeOfwt3+pJcjZTHinKahYpRuvzJMHfEzBxOrY27F5lay
 TtlmEVa8eI9mCVUWHvh3WyXB+wWOK004lMRh7FnGd9f2jTlRRN0tvCKXI5oym0yv5AN2DbHKT
 ZgYUg7KTIygEg84cmOLQ6z5USvPDcPf5UWs445lCA499CKnPY+LauVIkBDxxawqYJEQmvNDLj
 tx8ZzhlIv5fqZucDRS+tfp9xxUcsGQ3qFf8Bxz5FFKteCDGfam9yT6ZnpVofwpfatvfw7x7Ux
 tjBRaoBdIin5Gmy98bB6mkBkKVmcw27dIFdniml4DtHS640wuBpIZysx6mYCgkrAkRq92ckS0
 BAnanbpR5vZ8lpI02sxy2A1LxBBTvB4HhEucVbb20qaKqe1TEmVuFa5qmaAVwrMB85cFLuETx
 /sRfXpHqcu8WrFabJsYUP/Kb4WvsUyvs8wnwcoWCoGTjsfOMR2xBeSbbTbIategHD+8A0Qkvw
 nEi5BKIejhfkvwnsvrbMhI1w78gUsBxZYVyCArcxuoWY+2EVcHgm8DAUZjYD1PwGzE5aj1IFn
 NmKiuuqx5x/dHePg+LiijOpiLpD7s4DRYNWZZ0dlwfNyaKXapK2PUib2GzpF0iAkeS28hQJ4r
 +tuSPsPBkvlqSj6M3LiEIqC5qGHqauPUD/D5XAJPjiT9Vsdu/C78mmZiUfd+KrBzGIxhm3NFS
 4lwz6CjFRCBveplY4tcLwPvgt67GWXjp2KqtdpshPLtW8HgzmE4ZXiyg1ZUakA4NoWIuP7xaZ
 xEq39QzvepXY3LbcR3AFV4NRkDDudZQIeOuTFDyGEVTttSTaTHcsMaPK38oBu6P0/DUY70NNz
 0YM+7YiUH306nYoZxZkXpGs9IBCpv+d0z2cSIQeYgjSdUT6RhKTYNugfu++zuSqruodXiWT1S
 R4encySalyF4wSFrnGiNwNrlFeE7YijrnC9GZ+pEyXJ80OkedyP+sAztNWjXwpYLhCNt3xBl/
 qKYJhLvUA7ToLxGqMMDFyaO5gnJ5uM+Ljm5uORvDRKLavSTdqrESx/91TIhevOrwmTsb7rj1y
 A26PV+v9iFplOkvxENZso7pYLWsuNYKBKvDzqUjCVoTxDKx40kXVCUwdPKBReXepZ6ETL+OmR
 iDjqJYv9FZh9W1urvTOyMSUsmdE76DkLArN4rzVkB57dJiBS+BgvUb90JiAbvPprETYOHMzqk
 5I+fjfQeFdk8RELO1nR+ZXIgeYUQKlVPYaZ30KghrnrMIVkBGK7RhrqHW1XDFWCDvWTaxDABD
 VVAjI85ULvDkMLN7L0sd+kBqjQdwVXHRiEE09XqwkOhMwDgtoFsVanKB5o9zY2s2OzICidlGA
 AOT+P/b+9qUg7LvprpU1UzlfD8n0Fw+HyStwSZ1Z4VpfVt2DUfA6LCRsYuKbmoTVnd5KYqDLA
 8PipLgGF7Q044uBWIbaSsybQhIAivPMla5QHduljmguxPiK31oHZijTziH426vgEN83E+Q7V2
 /L5soeUtfs7awOxi+5o2J5p4EgwdpOnMUYDtuvPYUEPE4McENgCam3agAt84EsFuPE7sKlx70
 H/LeASeVbHWqp6wOvX1Kpp0g82GhadVMrCCak/Y/vG4Wa2+jO5q/B+0V6YwsnIPrW9+8/n9zo
 kK3BTcTy0DMoLAGsGnJM0IGFxgKxNXnNzNfOPrRFmHUTIlF8SigTqMgJx8YjLttyAfmL957Yz
 4JmffqWAnpFR5yJs4tLO9TG+zjfK9PIAGnjRyyx76KdeDohKH9wM8+53y1Lo6ktyaVZZ8PMhz
 j9OUwz5Znf22WssFTNcnTqJFGZFJY7+iFjhsVrZEg7eWUDAipdw77fBVR4QZehyrnBbXTvNTC
 EwfT7VcRf8Ob5+AKCpv3MIjGylun50sxcsNabuAzonUEbOJNh6E3QFdG+6tFmSC9YxPtvatjh
 yIWG9/q5V2hljPQSbOZg3EWTKyBuse8tIqpyxyXWcfzHopD67C10Bh3hOeDB/XJ3TwJOQAqW0
 4JmIccFvOqK9EG2mxOdePnqL5VsgAC5S4HSSfwrf36Spzkhk3LlV1+X/pCeNVivYBV1tPjB8y
 irbIZOQhBSHxKY6rdXtk2FjDt8h5EoVzVp/DjkbYhvgky4vA35P+aCfkyDy39w6MSMdofC/S7
 wMZHZYP09TP52s08nBlEDN5UjtoryVL0IDpSOoC2sPjSAmOP/i9u6dqOU0830FvE2Wf4NvoYW
 amnQYTzoTYs7FqN4/DA5jvUVbYQLjuWhnB4Vi8D6FC5VHh8/taMgA0eYWS1Sz4gTHadCV/jzX
 fOVJdAAQD1beHUhjZo3jQBXEtRrn0+7EZJrSkmvOr948JRRbOh44BC7z/W0NH6Q/7HshyM1LV
 jZ8DiowXqq7O11DqEaWTwMy5HCjeBMpTnSdjBVB1VHKSGe54sHpX3R4HmLePA+lSMtcTjp0k+
 7UE8yoQl68mBGN+qGsH1mcJWMiahCPhm31ULpKuYv4pv4UGGE3cjUdzLRF594Bz9aQB5tQk2n
 rBiQkA6W8X86bXpYOimRyTv5jfOKLM44XdVo5cuspB4T0qC8DD48Se0TNa5FIflbDW9IIAsJj
 /IToX1ryAPxl/STJ1dtISHuMy6ZmsIz3kRoYKNmFFHYbzK/cMO3oUi80OQWRh7XSoRS53nkxa
 FEDG5XfpVDIvOJePP9YwQ8gatzgvArOcH0+vESOkGg1/GBSI8Gfc7hQKI3pAy8Viy1ibfA24q
 xRQC0hxqvnri0hiRBVNQ7Wk0BrzPlbndmBo1aLX2VvcU+Jpb3ROzCggnsYHXgsU3GcHllj8HY
 aiq3RQDhS7HkwqhB0f1tVcRsJbAN5TwrjZ3T0cMyQNkFIKcLmXOvsLsDrwHIKaRXh+gAs0qa2
 l9XdmRIJ0RaCP4vqAIRC6di9Ff/tiYP/mfB7jjQngIwerFWmX1qWqIJFxdIc4BUUstjgLLSXR
 PiTxm9OoXNXfJQYKhEWGFSw7SMuleRnILV9Gxwoq4DbUr2FWWOP6mjSqW2Rp75KcbMCFar/6U
 alM402PB6SY4PxoAcPYYATquMcvbZ3XOnLvqMdA7lSx1BLTJJAr4YMNvN8I6q4ubPmfKiY1Dg
 EsFgEhJwQW63NrPHTXhvZ7tKGoM1EhXNuQBcGPV0A9dNyfcLc+oGo2CtZwqGvFWwjlQqh5vx9
 E6CakIEJaTqGbCsytqnjcG/BEKJzDZ6SwrbOjRYEoqBUL4U0m/B8yJUycAjyHjWBMWVFJbHgD
 F5ZSQjL75DL0a28AsQZDRdF+qQ3SD3mvwpmWc+tpGtL3Id6vJMQ==

> Add error checking for regmap_attach_dev() call in imx7_reset_probe()
> function to ensure proper error propagation.
=E2=80=A6

* Were any source code analysis tools involved here?

* Did anything hinder to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus
