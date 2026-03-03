Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EE139099A
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533381; cv=none; b=tVKJpyLnA20CJbp3r4wR0CrOD2v4QcHEefsA8f2oWG/5EXmALRw1yJOHe9SIBYQAr28tarJXoba1VwlobetQqj98wRq6PGtTDj0NTKsdRAn6ujk4qQ5d+IXpC0vTz0RC/gEbVK1q87+Q4YdlP/VkqvZ3AxuUPhp6grBMdPGauQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533381; c=relaxed/simple;
	bh=8QZ53I8aO4e9npdtwEIXgVcvJzLr6gDPjE3K7JQDGO0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=sZLIssSHXDcq0Q7KXEgmtPKmzuqsuWRKebLNUKYxirO/6D6cTrnp7FKSZyq8/Qgd0U888TFohA5A/GFhLhlgf54yP/iNi1IzvtEuCnPvtmzxknxby0AwAjUlcoC+MNDkP1P9LEQBfsnOWH3kNWcq6NLeQsn6wtoUyhATJC59Bog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bJ0dKuac; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bJ0dKuac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1772533344; x=1773138144; i=markus.elfring@web.de;
	bh=cQst+PSOV/+vNa7AIa+9u6jBKddkoF+Y1hVwXQIv8B0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bJ0dKuac2Zj/y1ysNiPEPkZX28t6flUPArmQxQArMoV+2uv6JLWmqO2P3CtoiRUX
	 oTTbOFQIKPV4eiDJa+731pwHaTa5KnngtqsC06kle4wz4zQ6zn4gSCrXONo8hkmvF
	 cbR9Xz1eAO2jzd0jhvQvWNqNO4mOYqp8gQmF744Dp88o8+6SOCt+4tvP6IBXxbodc
	 RxT4tIPEYzANFfJuXZtY97j2nhag1hL0nHH6UujdDgfnGOcqQQ+FVBZOttYY22GtN
	 BEXJYEfp5q218x1L4ijSfiRsesJegseC/Xp61W5sok7gvuq8jlDwtQ5QJ1868Q7Iq
	 v60H3TMsEiixhZRv4w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N79N8-1vcM042M72-013J3L; Tue, 03
 Mar 2026 11:22:24 +0100
Message-ID: <11b010bd-3435-4e78-bfcc-4bbc13106429@web.de>
Date: Tue, 3 Mar 2026 11:22:18 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 Walter Chang <walter.chang@mediatek.com>,
 Zhipeng Wang <zhipeng.wang_1@nxp.com>, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Jindong Yue <jindong.yue@nxp.com>, John Stultz <jstultz@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Richard Liu
 <xuegang.liu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260119095511.3030739-4-zhipeng.wang_1@nxp.com>
Subject: Re: [PATCH v2 3/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260119095511.3030739-4-zhipeng.wang_1@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aYut6SNpFH3u9i+TdmBskbprmbJGoCn7YPSgqI8npb+W9tqMPs5
 qwAY5huDYPiwt6IZovA33pZN9T/vQeR5ThmUhWUBkOTUqfirMVcDJ/+gA/9RoxIl0YvsUjb
 2DeRjGdmA7CxRcvXRdQFWxixHXJtcqeHsdNxVHN1aqwqGD1fG9lur2l4M0x4z5pETW7XomR
 WneiPGXsgmW+eGv39GxWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:duAUeuz/2+s=;/uPyBeUCY5kCDowLloTnNl3fY47
 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
 eJ0iZtUXCCFKsz90yxCQvcv4fQn+u

> Make the timer-mediatek driver which can register
> an always-on timer as tick_broadcast_device on
> MediaTek SoCs become loadable module in GKI.

* You may occasionally put more than 49 characters into text lines
  of such a change description.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.0-rc2#n659

* Would a summary phrase like =E2=80=9CConvert timer-mediatek to a loadabl=
e module=E2=80=9D
  be more appropriate?


Regards,
Markus
