Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F8F129E7C
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712246043; cv=none; b=Ldaxc7UCBCtNA7f5Xa7DyS12QV78n9HY5BIngz3tkUNXm0WVHegPPKmtz1Gg4eaSwO3NuBS16/QkzUeJ6WD8jbr1PjQn5QHBVhs3rFLhBZpGeiXZOzQT/DrvqOgYBixsBmDrMHgNySuaLfO2xWlDTFabxMM07MhNgJPteI/loO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712246043; c=relaxed/simple;
	bh=/3m8tbMTKbpp8DczNbgjKG86CcVoJKTX6w3QpC6Pclo=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=JXmDH7PyHbcENDOKLg8chVDeoArGCOKBQrm2147ss80pKLVHbuYvQjjaY1O2pllgMBc52k0wFp8xTp1w5xXwdst/JrbLdTPNt9L5xVi3mQh/bk7oeCAn9lNHGy+MrhlY/nav1GuraWX4zc/BT8BMazjal1cm+f7vsXau+7WdHF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWSIFTgz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWSIFTgz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-343b4601415so500194f8f.0
        for <imx@lists.linux.dev>; Thu, 04 Apr 2024 08:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712246040; x=1712850840; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/3m8tbMTKbpp8DczNbgjKG86CcVoJKTX6w3QpC6Pclo=;
        b=gWSIFTgzndsd/iNBQVpv+0ngA9I7xybD5+4ZaB8gd5//285eOCmRsJglyxIJfDwzer
         PF3XCJW/egyGMzKaFTkZzrQA4tF3o+Mr7WQ+d01XOyvLBBZr6XvAeIhqhhTi3pai/Qwd
         AICN4SlHOa39+Goc9Y/Wv4KsJibCZsUCFAHnLkR1XbFrbUEZ5o/vowU7VWQJteInNFB7
         jngrTvrW+Un4seHgx1fwPKpkAML8zXqCf68wlQy471CDnaKAWNBM0iu5BUwqiTqrIn8V
         OdXY09EmgQZMGYLp78ELL0SvU1g1v894bhFP9KvOwucY8ArJLnVwgbfSbIMlCFMQaXNE
         maBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712246040; x=1712850840;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3m8tbMTKbpp8DczNbgjKG86CcVoJKTX6w3QpC6Pclo=;
        b=QfdfAAgkmKY079AisveSap3O3UMMsW7N3hbNqUzTnNYX/TFKHXHRAtK/Rf2wvYXfpu
         3wwajrHZ7eczpAItIzQk1Ix5DBCyvbCjUw3Lxf8WlAqeL3HnJb7WnsGzX1DmckF25jRT
         MxfxdrzMP7RCBQiGRB9ipvWzXFLM1y7/LfThKTZIYyRYgrIReZAHIoBzrdKI02nS76fB
         mTen8acorlzoD2aZI0/T261F5I1XeDNhFFjg/ZgNbjgU6Glvdh5NAqS2r5bl9U99J1MP
         SQHY21GC9thxh9iDN5A9+rnTl7MKM/OCVSY/YdrSyFQeDskW+NfZTT7h9VOMegd1rrz9
         aeXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdNUakFi1BK+ulU+Msq0PVNmcwCYpAJspjjIyKon1ClT9ibgMm0qiM1Qk+NH4dsZWq9MXraiJnj4eQ6LaG9zph5AQp
X-Gm-Message-State: AOJu0YyhxofNK3y29b4qErfoxtbPKwmU+OrXvPtX80Qc18QkI2NJLg6i
	nv7cTkEz1LikXfuIUPR/YZ6A25+OF0ITEsKL5pZoalcBv2bzFY8W
X-Google-Smtp-Source: AGHT+IHVFPGEZrCTsk92L3eJtuYBge9oeCNt9BZBgO+gIRZfLUwK7t6faaFK5b1/SpqxVj9fbL6r3w==
X-Received: by 2002:a05:6000:4f1:b0:343:6c07:c816 with SMTP id cr17-20020a05600004f100b003436c07c816mr3091423wrb.16.1712246040329;
        Thu, 04 Apr 2024 08:54:00 -0700 (PDT)
Received: from ?IPv6:2001:8a0:e622:f700:7d3e:f9e7:30e2:91a5? ([2001:8a0:e622:f700:7d3e:f9e7:30e2:91a5])
        by smtp.gmail.com with ESMTPSA id by7-20020a056000098700b0033ec94c6277sm20590586wrb.115.2024.04.04.08.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 08:54:00 -0700 (PDT)
Message-ID: <fccbb040330a706a4f7b34875db1d896a0bf81c8.camel@gmail.com>
Subject: iMX8M Mini suspend/resume hanging on imx8m_blk_ctrl_power_on()
From: vitor <ivitro@gmail.com>
To: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: ivitro@gmail.com, vitor.soares@toradex.com, ulf.hansson@linaro.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, rafael@kernel.org, geert+renesas@glider.be,
 peng.fan@nxp.com,  linus.walleij@linaro.org,
 u.kleine-koenig@pengutronix.de, marex@denx.de
Date: Thu, 04 Apr 2024 16:53:58 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Greetings,

I'm trying to suspend/resume our Verdin iMX8M Mini with VPU IP using
the latest 6.9.0-rc2 Kernel. While the system can suspend without
issues, it hangs on the resume routine. After some investigation, I can
see the Kernel hanging on imx8m_blk_ctrl_power_on()[1] while resuming
the hantro-vpu power domain.

Any hint about that?

[1]https://elixir.bootlin.com/linux/v6.9-rc2/source/drivers/pmdomain/imx/im=
x8m-blk-ctrl.c#L101

