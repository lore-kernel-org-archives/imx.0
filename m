Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A14128807;
	Wed, 17 Apr 2024 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713350689; cv=none; b=apAFA/aCgYWxHTXN8vS4TpAfs0OWY1VXHh37EViSzqnvEclkDvgDOFNKEbu+PBVEBVOTHcvWJyzIOtz8Smiq19Llzr6Hdd+KbXAUB/AI42XxVuWJIE3ra7wOAzA3gf2158ZhNhBXknqlJIFfJ9y01IX4F168sWrbFechk85dfPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713350689; c=relaxed/simple;
	bh=lqVSHyjQovkmdTfW/oYvU9zJi0CsYmYN+rogRbERdeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoMpttb0NpBXKyMzvY10KH3SFFpzujG7ZmwcUHaG5h14lJ+My3QtiCij4LlIa5Xt5YEYlLAiZqHDsMo+ohiXVRid+sY6rhDKjYEVoc8u9jyk3vhlnV/XfeyrSdIRalNa+37XiUi4GIjd3me/m5zSU9QfT1wzmni8kZX9PasjoVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=hFjXpzvI; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="hFjXpzvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713350671; x=1713955471; i=wahrenst@gmx.net;
	bh=lqVSHyjQovkmdTfW/oYvU9zJi0CsYmYN+rogRbERdeA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hFjXpzvIWwkDQ8sPuAV+L5B/gWL40iKo8vPRggiwG3rMN+hvhGcsouvmlcB8ypLW
	 WXuoPQfiAtAiwrcUmBwFrsltfG4BdL/02+VpCdNM0V5xb7jaIxP4VMkYskAa/G9F+
	 cN76VZhHSCG4qiun+HFiSRGXEO3tMJ4C2VzFfi8SsWeIHn5RK/WAQaRW9Drwvl1MV
	 yeYnymWaRHiwbdvpma7hVbFbJOUQMN/YfOOA+PqpNk39WCGtIoV4WNJALJ7jBfPaB
	 6kwk4uVSgoCi5li0KdS0yOOFwCuQ276idoG7jjUniDTaKOnegCXka/gYZSCzJfPGb
	 rSZEKDltcfZH3Uxjkg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hvR-1sucWG2INT-011jA8; Wed, 17
 Apr 2024 12:44:31 +0200
Message-ID: <97a35f13-ef9b-43db-a10f-0593b91464c4@gmx.net>
Date: Wed, 17 Apr 2024 12:44:30 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: imx6ull-tarragon: Reduce SPI clock for
 QCA7000
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240416190659.15430-1-wahrenst@gmx.net>
 <20240416190659.15430-3-wahrenst@gmx.net>
 <CAOMZO5BA0f9Y9knYm3MPbZ-t0=v2V3kkLTa7111tUndNep7moQ@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAOMZO5BA0f9Y9knYm3MPbZ-t0=v2V3kkLTa7111tUndNep7moQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aGs2FQXEeNjUXfXlVX7xhs5BDVZ84hUx3Z4b1BBDzhi41PM/8ER
 sDHFVIuyoSCV/cIP/0KpxTWesRYeeu4t25VnXDI9PIkvTRLA1ZNaEsRAP5cNR2wRq2syfe1
 lENPTUe+fnLps/TD/Vr7qnIj9iW2VxJsELYyuVW75cww3pcZ0Yza7vXHLA5Y1iEd1jJNVjb
 xyncPh3aZH7vO8FquMcjg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4EedHW3+NBg=;qn1PZ3odbYIAPafAlPZSoZFcGfh
 h9uoXdtN5BEbt3iWi2upwg+m3/Qix9G5MvA22LEmKsz/loArb5jJqKiyHpqPd+1FCAfaCjMVe
 ImzENB0HsxhryqW5oLN8F5xM/l9LRQhn0hHx4n1X0Ws195oU2cY79M5rq//j2zb/n3BXFEVqX
 I4Xim1Wk04RajYG4vZkeeIB6dmlcKZiJdv4smnpTN+CjFQtegL3WIUx44rqP4tkrOTeBbp1Dq
 kluZFZlsdraWRwimxOh3/PnIpGNXFXPbTCHGHsskL8fnEbf9+K2QS7JuSdP72Rcp69EWa6dk8
 ERvSXFvJg+HGspLKqxGCX0kJmbXZeas9vUcn+AmVsqOCZHfeyaxl2OV/0Ww94epWv34E3rB5t
 cCHbnHIba+W0ZNWeYhHZri8vmn5PPrfZUePDxi/xZ0rv//kFrAnpqaZe1KuJx6uG/F+uJdSoj
 yi8fs6iOb366qJeS9K9neFjjrd1QzI8A+okKqsxNEVhyCmCR7oJbuTX408s2/CNYYPYMNKvRT
 ozHRpcoMr4mo+23UhepH1zrbdIw3ilKHxmCKjoDQ4MNS7oEdsDWARSZ9wt4g5ePWAC4hId9QF
 5pPq5tdcz3EvJDafBO+klerFFoZuPzT5Zr53m7S7JbR/VHdhVg3Ddp+PCvBNYQLVPwACH+qIt
 Q096nQCb/8aG85Uh4y2U2reNpxPZ81wI5FVZ5kbx8HQ5BWjJLoPuyC5D4ZEUsBPd+k8PFqwXb
 BecwQcWhheqCCyQ/qWrCAjGj1uGwP3R978mYHV1Dct+85fZMkmMWqxfulpkzsEFj6sJqWz751
 WEi0Npq/SKO1McWAeooThei7r+uhZt7z1JzlJyrgI1v7M=

Hi Fabio,

Am 17.04.24 um 05:00 schrieb Fabio Estevam:
> Hi Stefan,
>
> On Tue, Apr 16, 2024 at 4:07=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net>=
 wrote:
>> Our hardware department recently informed us that, according to
>> the specification, the QCA7000 should be operated with a
>> maximum SPI clock frequency of 12 MHz. Even if it appears to work
>> at a higher frequency, we should not take any risks here. A short
>> performance test showed no measurable loss of speed.
> Should this one have a Fixes tag?
i'm undecided about that. On the one hand the the former clock
frequencies are wrong, on the other hand we didn't experience any issues
with these frequencies.
