Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871667;
	b=OtPb2Feh2nXWOZpTUjs8EQ2GmY3GYAxUclAXDIJfrTjTELu7zdAqGBUFzWtDYvLcChrY
	 cCdFYI7vQdDAtJezSQZMniyKbBisgdOa38S+Db1EEatk2XiXLX65FFuWLiX8PsLusXZH0
	 UjEbBKZaRwQLGf3bdVC9y3OA+68c/OS1DEKVQBtB/RK3jRLWAQhyRUIeFxk7CILgl9dHM
	 w4QvzX0Su0nSibszXfztVBwAkcS4n7CxUVLmhzGWNe8LZ4Kr9RtSWMtLGLPJWLojzGWjX
	 547aRpiTRUbAjtdwj6iOP1no9+SV5xwxTG/vtQ3GuKzVaP0HPPz0TLzBJIA17yFfDLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871667;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eOhqa48dtTiB7ksGp6xxxSY9GgyF8VUpdic4WCjGsps=;
	b=f6Y4CBwx+jBHWBzr+OD1dPzMSPbt+S/7nclTCil9LMfzzxg6U+pemF3DlcDyQ4yCmcib
	 aMSyVpu+wc0gqtfnbkGekcf2CQ+BvWlRIyNqC7rDqldq0QMqDuTUBTnzTCbxOXh2R5JKE
	 j6ZMHkeR03Rw61zAelCM3U324c5+OWDTV1J1nJIWfKOxRrbakDbrv4txlQoU7MdcvNezD
	 2+toDASS4CISR8GAyuIiUrRuRhNvf1rbgcGs+m1L0Cq65IVW4L9U8UurzD3mavdUaXlw+
	 aQKeT9hJxyvsC2kqiiqCMtikSHzhLJhLcTviuf+8qeelqZRngazhH3MgKmWR/skpcAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=MFi0Itx8;
	arc=none smtp.remote-ip=162.62.57.137
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385EB606A31B
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 09:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 385EB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=MFi0Itx8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793871649;
	bh=eOhqa48dtTiB7ksGp6xxxSY9GgyF8VUpdic4WCjGsps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MFi0Itx8oaPUnsDeYVkQ3fCCa6BduDREuunWlJMAT6Xhfeb4xWK2/D22ZUzSmcWG3
	 YvQgkfmSCOmYlbCALUQBFAPVSC/TnMVuPHmk/beeGAWQ3EuH/m/czGA3fyNaQv6Gn2
	 t3v4D7XKYalpKfECoVRVYZyUh0cA6eJdG9kadfOc=
Received: from LAPTOP-TKBJAGN4.localdomain ([27.38.177.45])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id A2805CD6; Thu, 05 Nov 2026 17:40:40 +0800
X-QQ-mid: xmsmtpt1793871640tlh7jbj61
Message-ID: <tencent_3D65EAC95AB758A272F0ABB30C86ECE2A205@qq.com>
X-QQ-XMAILINFO: Npv5yIQT4nxMDZVNMNpPvnUCLCYe2yvr1BsQqzulHOgeFeXvm4sIboiwxfUQU2
	 J/AZ3pDGmOmiAedfLd69Tfl8qBsdhhP65I8wPzQNT3VRjmbH4HR1Zz15AqF39cYJhVZbZbSOfb4z
	 s2qZNaQsRgbtq2Ubi+HSqXkNZksmocMbsjC6x3iH+B+g5dnHYx3e39wXbWAcVl/mrBM1p215dsij
	 Xj7PeT9ImWpD98AWR02uzXFHUHivlS9ZaEASENrr0ScoRM4eo8DkbdSNVbW7UuT0zmm9XMAIEUGq
	 WlL5iYxx39JgAChMFgfAJozITWtRS5Et/9SE9LwncCCzL4TDSpN24amO2UT3KCkcrEcBRwkiFQaf
	 XLToVnJ1X+uSsARK7YwM9nMumnDTp/6bpMhHEMhRpuc+XoItxa3XWdr8++8/YUcgoWJtxji65Z1P
	 qwF17rlc45yDIwmbaRDfk9GtlCol11kzX4XEcc/dqWaZPdjudwg+E/A/0u9Dr1zPxv93e8m7jsA3
	 /xM+m6h8CONtVNGdUssOfOnUwhBT8mTQesMdHKDoFxzx3MZOf6qnNQHQiiFe8/CiL4uM45ZvuYac
	 OhmN/9q4oVO6JEZ4d9uLPEmTHNj8lQLBje+oOpAgsaNFj21yf0+ElgS1rNfwS1Gr8SoXHkY3THTQ
	 5XOInxRIOjPcXxXi8CEjl3IjHAUyz04rMZQ9JgHsbDmWfzBAT4/okUvafk30VpAmXVKyaI6eR0sp
	 8OjYd0OBHEMoPsBX4S87YIz3H995Tl3m73KeIKsDhczbCfXqa058RhxD4I1jQrW/RncYh8jzYRwB
	 dLD0ZX78FvCg/FaOh8VVTAz1RHxRV1+yBT0h82DYgxfslIZInjM0/ECKebQ8O6Tp6ZReH8qMPx/J
	 RaGECD6RrCVlAgG+JMdDCj6eLEmW5qvYrrRwuYDS7R9P9sucDS0uOLByn3BhPzNwBGNJA/DHVYU2
	 yvkpoMC3zaqpBPM2zHuzc6tR/w/1xIWlWKarOY/hWKgHNSychtGMcwGDSFuc1qye0/19xC9O+njS
	 OmwF70dpO46Rnp69ecfJGN6cBubSBZ4na6ystfH+AHvl3cgzZkvYKevfTRp1PtmiSIPe9Vis0Gsj
	 ngKEK1yt79lcHBtZI=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Haobin Jiang <lemonoutput@foxmail.com>
To: carlos.song@oss.nxp.com
Cc: Frank.Li@nxp.com,
	andi.shyti@kernel.org,
	dillon.minfei@gmail.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	lemonoutput@foxmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	vjardin@free.fr
Subject: Re: [PATCH v5] i2c: imx: honour I2C_M_IGNORE_NAK
Date: Thu,  5 Nov 2026 17:39:09 +0800
X-OQ-MSGID: <20261105093909.4983-1-lemonoutput@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <93667d47-794c-45d1-b72a-a463d5289a29@oss.nxp.com>
References: <tencent_E6D69775D91AD9FE45C994B3755CB1452506@qq.com> <93667d47-794c-45d1-b72a-a463d5289a29@oss.nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Carlos,

> Why not follow community rule to make patch...?

You are right, and thank you for taking the time to point it out.

> At higher version, better commit log and put change to commit log bottom
> with extra lines like your V3 patch[2].

Agreed. When I prepared V5, I regenerated the log from the current diff
and did not carry forward the problem description, the test evidence, or
the review history from V2/V3/V4. That is my responsibility as the
submitter.

> I think V5 patch commit log should be better with shorter and clearer
> problem description, reproduction, resolution, verification based on V2
> patch[1] and V3 patch[2].

I will rewrite it that way for V6. The commit log will cover the
problem, the resolution, the reproduction/verification, and the review
history with links to V1-V5. I will put the changelog below a single
`---` line, like V3.

> But abviously, this patch is generated by AI, and it dropped most commit
> and discussion details from previous patches.

That is a fair criticism of V5. The tool produced a shorter log; I should
have caught that before sending. I will restore the AI-assistance note
from V3/V4 and describe which parts were tool-assisted and how I verified
them. I will not resend until the V6 log is self-contained and I have
re-checked the new zero-length guard. I will state clearly what was and
was not tested.

One point I want to be explicit about: the V5 guard only rejects
I2C_M_RD + I2C_M_IGNORE_NAK + len == 0. It does not fix the pre-existing
unflagged zero-length read path. That scope is a deliberate choice, and
I will document it in V6 rather than imply the general issue is fixed.

> AI-generated patches should be subject to more rigorous review and
> testing... humans must always remain in control in whole flow.

Understood. I will keep the human review and test evidence in the
changelog, and I will be the one accountable for the content.

Thanks,
Haobin

