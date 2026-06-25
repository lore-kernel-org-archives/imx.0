Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E7C39281F
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400089; cv=pass; b=PFyC6N+MX4LyeQL+bF8MFux7RZyzgXO+nC0disEPajToJQXRZGZEp5jXdCyyJIMtnT2WvUT00IexQp5ilGBjn7qKMpLFec15RVCFUSG1Wdwt81ZcH7uO+yXoh14dqzg6mnFkt/9Zf2xexZaauFev2Oe5UYenvbDdHqoJHOl75yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400089; c=relaxed/simple;
	bh=MkO3fCXc1ZaOKiTnsnssleSvXkY2yN/+fGVR08qjueQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pbY18H0qhL6bMsYJe6qEwekSVBv1NKsTDzmO3SwBgvA/vINvS/Cs3tPUD2SAqt4lzYAtFTNL47UR5tXTZbDMPnnxtUEd9enQpNcLdGw9yh+H4mlESi0+uu64fCgLmWD5wpbToXwTDhvQd5y6QaTIP3uuAVKNlgfJnJHJkNI9w5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYFsJMHq; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYFsJMHq"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bec49f7e35eso537865066b.2
        for <imx@lists.linux.dev>; Thu, 25 Jun 2026 08:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782400087; cv=none;
        d=google.com; s=arc-20260327;
        b=LPVPipIBIhi6H/xA8HsoHPqJ8kjPmpSNPMiGoN2n3Yflr4GtFrxihkIw7JvT/tZqz+
         GUYUpLtHoETR8/QBaERaVimH2A++M5SsLX7/7Pox+qAGfhK0PnVLIKadQfxyrXHoQjvQ
         UetNFMZMJhnDEZXYfWBIdE98kqvSWUB+/UDE58+7doLid/sGfemFuXJjxpmRrDra5+lT
         k86GNTvROBMV7t5LuO1H7VvO0yS9krQ5urpa/NNHLwMIZSyB06vkGJdczRAcZV+Y+jZL
         fXMhmFOkOttnSCHDro0Am6lp4UTBiYHRgVlKDHWq7cDORrW/sTXA+t7f/wSP5yGQIVfo
         Etgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MkO3fCXc1ZaOKiTnsnssleSvXkY2yN/+fGVR08qjueQ=;
        fh=JHY8BXtxZ4MP84r+lYg/58/LA/iibw+GqjRFCu2Wfr8=;
        b=c67gXF5OLNi8wTjwn/zHVEorGUCkrlQHeRyw9aMoSZwxIt+7gL5W8IxY+pDYT4qTIQ
         0ra31NS4T1rtJWzbwQHrFca3r98vPVNVHCQ0EYH3gIy+ivykmq7efH5iZfZxSEjRW3Fb
         nw1ZFZk/iPlRXrjVn2dFHo0Fon4dG18wlbMQ0fEPMMlG7EPE6w6qwxUEkqboAz/46QWo
         R1iOzGn4U1dfxHx8KssS5c4YhoyOBVgZ7kvSTJZw2twYmgSK1lBdAu1I7WienC363aO0
         bgiDGGAGdJ/Hl6MsEFY4hZoF0VevwsBhuc+hjETC/yBylnr5Ri9uslTsDj4b05nVDM0p
         u9qw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782400087; x=1783004887; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MkO3fCXc1ZaOKiTnsnssleSvXkY2yN/+fGVR08qjueQ=;
        b=EYFsJMHqvriIK0CCN9cUYauvMSeXTPRv1Eb4JkBFl2P+IwzjVwERS8psT7NAEKvLMp
         6H8+davHrrYNiHzWraEjTdG+us/YDuKsiN1+8Z2kOzydzE4bghJrKlrtDW1lDmlSPtHl
         Dgx4SAtZq20BnG2rSLY+ZxkjLrJLKf8i8PBhYcyC4qw5Au9opwkc6oKRpmcXbsORkmeV
         RXz5ypmtV40TkFbnIRVnBFcTwohq0gAvqI9306d3CMTCrv6kON8IxPSAi06Tp/wq3L4j
         WI1Ok83kJaTY7x3Yx7oYkgQrzUBF0zxt34bFKTKXoDmQhrY2nd0yv5yXRF4QmEe3SgWf
         B+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782400087; x=1783004887;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkO3fCXc1ZaOKiTnsnssleSvXkY2yN/+fGVR08qjueQ=;
        b=fNqHi7imWrlOIHRkRAbBODyCXkKz1+CmXOOfQAqLsC6FQOV0sUUQZI59+gsB8btJmg
         tqfcctYzjHVn314LtgDmJHpWMtQRQy4dfHGFtu1Im3EdKn6yJDzNx7BOGXMinKWRt2Gd
         6UbyW6qoHzQhuKr7IOauobsabxvTxm5OPe7mF51DZmiL17FBOaAUTpf0xU6o1n48JQHe
         zdymSRZ48Gena6geVC88xoUBdL4mCk23rpRycBBEN0UIv2z3frwtHWXDGhOM7nGkjmmC
         KFpcCJq0+GYIL58zoj1YdIC9BQwRE1lvXfpSWhGrr1PGplQxKw1+vVNMv1PvtuA/MNhQ
         FISQ==
X-Forwarded-Encrypted: i=1; AHgh+RpB3Jx4dxCfeCrOxnirqRqVIZz+wvQRviAB3zlGfPKTzqcCBy2LxiDK3SXIEtL3mFYqzKw=@lists.linux.dev
X-Gm-Message-State: AOJu0YylxE52nAhgZGsyx62PBIJ29XzrI9YEKtMLtUdIRvx7z0/Q6FNT
	3U0+fCxg3SADxZU9wXYvzky/wM4KD10X5c3hgAkQY/POfmsnSg1T+14TfxNKb4yagiCnQXIwy2C
	Adkq6IlT69eGEWHB+NIlD+8HSD8d2lKg=
X-Gm-Gg: AfdE7ck/USyFLOTqp7bpxd/Bt7Ju45VzK8ArSoPVRJp7guR7T0Fgl59rwVpUTvxq1qq
	K8tifuMhrctDUWl8CV/Q2EwLKEbwaZDj52XWjIg6IO0wr3s8L3sKd0jJybqFgpAbtTwBua2AMzh
	KhbZ/P2L2xJ1SBJ5bUZNlVSXO+yRezTEqNbvug32bSlT8wIbL8oK1fuHcWMpwl/jsJyOQ4NVAp3
	DvbNWzou4Z+bVhYtKl7/SXGAw+Ppg5DsMXvdYBk9ou3lSzzy77MsLUoN+LW6N9yAmql7PnH
X-Received: by 2002:a17:907:8d8e:b0:c0c:2033:c078 with SMTP id
 a640c23a62f3a-c1205ef178dmr223399166b.26.1782400086250; Thu, 25 Jun 2026
 08:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: liem <liem16213@gmail.com>
Date: Thu, 25 Jun 2026 23:07:54 +0800
X-Gm-Features: AVVi8CdXewmKMx24Id0KrC4KlPydUzifiJZC1utFI6DQTmNGydZ-bYS7JAqj14c
Message-ID: <CABoz+=2PHMv0mqxPwHyR5rBOhT7xFxGVok69JoYhadQTuNnsdQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: imx: Fix slave registration error path and missing
 NULL check
To: liem <liem16213@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Andi Shyti <andi.shyti@kernel.org>, Biwen Li <biwen.li@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, stable@vger.kernel.org, 
	Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,Carlos!

Thank you for your review.

Q: Have you meet the issue on one real platform?
A: No,I just noticed the error while reading the code.

I think your idea which cancel the slave timer and wait it finished
after disabled IRQ is better.

I'll fix the issues and send a v2.Thank you again!
