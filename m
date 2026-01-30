Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D6350A30
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 08:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769760935; cv=pass; b=gDfg1Bu3g8c14kg4Jo+biuVDaZ3tlLIrKBt4iirHNdIW9NhHP9RmC34EdK4V8X8tteOIjdy6WfZmtY1LOSuk45rQS3eT6eS9X1/du6Yo+++WYFRlgsllHbMb31wRkDNoGNjfFzUjRjVudiHhItisDPM73VMJWJFugAsMVf3XbIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769760935; c=relaxed/simple;
	bh=1PP2wyM7jv0kDdb8k1BholOJdOLHYLeXLghCq7d09N4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYh02U/ZsuO37Xze4DlC73orLzcAfYq7pzBPWtIy7jYhHKeGv3Fvn6CwZfukKVBiGN+MgTALEe73foCOiHFdt2XDrAJhUTEJ+Xk+LyzEeTAjpQzC5a2oi0s907AnzYieonomOYxPQzMymb/IYIHqW1WBRonwtTjBgHmvpSy9+T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9yRjkPm; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9yRjkPm"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124a635476fso2748778c88.0
        for <imx@lists.linux.dev>; Fri, 30 Jan 2026 00:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769760934; cv=none;
        d=google.com; s=arc-20240605;
        b=WLH+AzjA82pcTsLKFeJuUKGE2E0AjudsJTeIvnCFAd/s2dWD9K9UOhy90o9Y2nvqEy
         aJyVW5vLWh5tuIN7zaIU8ubWcBBSh3Rx74FQHrRvP4Z0he41UapFtVeSRx6t+fKgK3VK
         eynU4CYZvsk9wvNaB1gUqHbNnrzjz55Ko72aC0Cq8TqqUBBHkOVimVwtttDs1pFxu0Jj
         eqBtfD/VY69CbwX5zGt9UCZ8SNQPyvwkL/n9P650YB+vohct80UlcvZdHR9jVtp3gzyA
         P1mD/x2EId7y+kmqvbemmBBevR8+uglC8pi3ME3hpc66YUorbOR+gC8bZBouPsi0B86C
         K0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1PP2wyM7jv0kDdb8k1BholOJdOLHYLeXLghCq7d09N4=;
        fh=6wYCE96LcH4K0LDIM/LrsRTM4zUBy6hMkmhxY+edutE=;
        b=Pc1MwSp0QBZx71rKI2OvjEzMODqlIpByk3mNRpALYN6SlYT5mH0J48qeloKjnbR/sQ
         APvEp5bxXGtxKOrh9kQMQX/4w1YXFjmEoyKZWTglU3CcpN7Q1cI7DFOE8YR5qkEv332Q
         /gmeXYRWnHwfo46E7kxuE/+jDV8fzk9oeUXMUcfToQRTNX8kRtxXVYWpmh2/CJKfeSJK
         LxoVYi1HTSLwSI6JJbd1Oy57Ia2NUEv2Eg6qByrZpD0mVO2OJK/ZdX7pT175/GfJtoGt
         T+4bTvqQMIJeyvgoZXyaFrUdizWbI8uLIdFAM/IG95wBBOIEXsjaAA/Ra/6VPtzRBXJT
         Nycg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769760934; x=1770365734; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PP2wyM7jv0kDdb8k1BholOJdOLHYLeXLghCq7d09N4=;
        b=O9yRjkPmWYdSzs566Asr9a4MhSh2dWFqJLN7tVjmVx452+gAgc/+ryLhSMTgnkPtYr
         Aos9cODklyCxhAyTpgZG7CIyc2teg4EsJdDT0612Wp84k90zGgFCTiqSeXnSXoRaoR7p
         22+YE1XYTvtteNag5fGOvd1uOlTknXBbXhdse+XUqbYKRusagTh61f/MJQri10HbQKHo
         XYI716DLNfvp9nkvUj5rIKWfby6d1tB/4736XYL45EHVSMqqh8wgHGd69DnKkvQ1vZoN
         AKmC6tP9ATEk3OT7bgOAV6XQubFrTOXblxMij58pBErJkPkLiWss4w/17ya0aeIPv6Bw
         GmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769760934; x=1770365734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1PP2wyM7jv0kDdb8k1BholOJdOLHYLeXLghCq7d09N4=;
        b=SZKH6hQVypeY+gvOrW7l6OoZjWakSm49GmDLruzX+ITZYBl+PZR1Noin4Bh4bpgTlt
         MPwdEX1uMtWHSbrzPyOTpDk0VKPWOiClL0M4fUur5g67FDdzRrb0lxho41Jdtd0c8aKA
         cIF0Aw/wKP3bcT6uISTqL92iyeftzePm5ia8dbzpjpdeinqfZ6z9ID9dX4SInA3mtNhI
         YSBKCIcuK6qKSPj3g6fjS2oRXMC9j/bbA0uJLVKUvV2bCj5xCTD4PvJjGXVNGHbaYCJ3
         0CYMDMq0IXiDjOF/mkSlGT8lHimD775w9yJ7WsU3C4oUbCZJWK8MFuRlJofok5MFw0bc
         8yhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBLZTPwBGi0a3VP/6lVsFs8gcPhPwvuozvY366+cmZJJWd8zZVN61SnP4EpBmlc13Fa7w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2p1o+pzex2uvNOYkg+3VuxmKa2au8F3xtl14iCbYn6UnJfaAR
	HDe1AccWOLeKJ51209VgJgmo+0nErNLWsmeySBn0993oq1Pjsw7f5oVlqGQHbwFeeV6YK+2SMFA
	xkyT4snh8CWfYbFinuoGhS+wRrme4ciU=
X-Gm-Gg: AZuq6aKZMNBHVJ9535ltJAY8dEmruZUwlXW4KlthnqMafBhihgqtGKzSLY3dSU1ybgj
	r7u/kvmd5WP8L56Od5ryrPaEdEMHI9GJUR6GxNzAvz02PBcSsdYx4sh+j36IC5mE5sY8SIRebTG
	ZNbJjoZNPE84E1uJw961kzT+X+4Mdq99UbORuGliF/BVxjwmEMDzbSaex5rvUcBZWNWrmRKI1lY
	ql+ltLTXyqgan01Rd9UIjYrkL+Z/Uxp4aJ69zV2GEevuGoZCVjEYovzJhquRgQYC4W53RI3udw6
	y5yjAH19zuJvMS1VGWfB158vgRwDdCI/WSVCUwz8mntwiE7/gyUkKvnSNYSc/kuEtjIqu/QiUj7
	tGp0z/b73e8HReA==
X-Received: by 2002:a05:7022:6190:b0:119:e55a:9c04 with SMTP id
 a92af1059eb24-125c0ff2590mr1058964c88.32.1769760933549; Fri, 30 Jan 2026
 00:15:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130051107.2130200-1-xu.yang_2@nxp.com>
In-Reply-To: <20260130051107.2130200-1-xu.yang_2@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 30 Jan 2026 10:15:20 +0200
X-Gm-Features: AZwV_Qhfj2kYMNnPMsstGvF02XqNFQQbyZZD7PPVRqDDkgSk9_oYbnDVYaLdLH0
Message-ID: <CAEnQRZAcM+OquwS9Rwh03ca5sbofv7DOePF-0NmB9asrMR_Tew@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx8m-blk-ctrl: fix out-of-range access of bc->domains
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ulf.hansson@linaro.org, s.hauer@pengutronix.de, Frank.Li@nxp.com, 
	kernel@pengutronix.de, festevam@gmail.com, khalasa@piap.pl, 
	benjamin.gaignard@collabora.com, frieder.schrempf@kontron.de, 
	p.zabel@pengutronix.de, shawnguo@kernel.org, l.stach@pengutronix.de, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 7:13=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Fix out-of-range access of bc->domains in imx8m_blk_ctrl_remove().
>
> Fixes: 2684ac05a8c4 ("soc: imx: add i.MX8M blk-ctrl driver")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
