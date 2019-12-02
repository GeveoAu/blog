\---

title: Safety Critical Software Systems

author: Dinithi Weerabahu

linkedin: https://www.linkedin.com/in/dinithi-weerabahu/

description : Quality Assurance, Safety Critical Systems

\---

Safety Critical Systems are computer systems whose failure can lead to a loss of
life, serious economic consequences or environmental damage. There are many
well-known examples of safety critical systems found in world today.

Safety critical system is a subset of critical systems. Many modern information
systems belong to this category in terms of financial or loss of life if the
systems malfunction and cause severe damages. Since the failure can be
dangerous, these systems are designed in such a way that safety is ensured.
Safety is a measure of continuous delivery of service which is free from
catastrophic failures. In other words, system should not injure people or its
environment. Even if the system malfunctions in some way, it should not cause
any human or environmental damage. The most effective way of avoiding accidents
during a system’s operation is to eliminate or minimize dangers during the
design and development not afterwards. This diagram illustrates the
characteristics of a critical system.

\<img src="/img/Dinithi_1.PNG" width="500" height="400" /\>

Safety Critical Systems are strongly related to engineering and increasingly
computer based systems. Developing such systems require significant advances in
areas such as requirement specification, architecture, implementation and
verification. Formal methods are applied in a wide variety of contexts to both
hardware and software when it comes to safety critical systems. Hence trusted
methodologies and techniques must be used for design and development. On the
other hand, well tried techniques are used rather than newer techniques that
have not been subject to extensive practical experience. Critical system
developers prefer to use technologies whose strengths and weaknesses are known
to them rather than using newer ones whose long term concerns are unknown.
Formal mathematical methods of software development have been used for safety
critical systems. Cost of verification and validation are usually very high for
such systems. More than 50% of the total system goes to development cost. In
that case, formal methods help to minimize the amount of testing required for
safety critical systems.

\*\*Real world examples of Safety Critical Software Systems\*\*

Medicine

 Heart-lung machines

 Insulin pumps

 Infusion pumps

 Radiation therapy

 Robotic Surgery

 Defibrillator machines and artificial cardiac pacemakers

Transportation

 Aviation

o Air traffic control

o Engine control systems

o Flight planning

o Life support

 Automotive

o Airbags

o Braking

o Steering

 Railway

o Railway signaling

o Traffic control

Power

 Emergency shutdowns in plants and factories

 Nuclear reactor control systems

Weapons

 Weapons and defense systems

 Warning systems

 Arming and detonating explosives

Infrastructure

 Fire alarms

 Automatic doors

 Emergency dispatch services

\*\*Testing concerns related to Safety Critical Software Systems\*\*

Due to the growing complexity of control systems, testing process will become
unmanageable in the future if only conventional techniques are used.
Conventional techniques usually require high degree of human interaction during
the testing process. For these reasons, methods and tools helping to automate
the test process gathers wide interest both in industry and research
communities.

"Serious" testing - not just playing around with the system in an unsystematic
way. So it always has to be based on some kind of specification describing the
desired system behavior at least for the situations covered by the test cases
under consideration. As a consequence, the problem of test automation is
connected to formal methods in a natural way, because the computer based design
and evaluation of tests is only possible on the basis of formal specifications
with well-defined semantics.

Despite the system’s complexity, exhaustive testing is infeasible in most cases.
Exhaustive Testing means performing all the test case which potentially uncover
an implementation error. Thus it is necessary to investigate test strategies
that select subsets of all relevant test cases and at the same time can be
justified to analyze the "most important cases". Majority of defect leakage and
the resulting cost penalty of safety critical systems are due to incomplete and
ambiguous requirements and mismatched assumptions in the interaction between the
components of embedded software system architectures. That’s where validation
and verification come into play.

Validation denotes the process of determining that the requirements are accurate
and complete. Verification denotes an evaluation of development objects with the
objective to ensure their consistency with respect to the reference documents
applicable for the products. So in contrast to validation, the verification
process can rely on other documents specifying (at least in theory) completely
how the product should look like. Verification subsumes all formal and informal
techniques such as reviews, audits, walk through which are applicable to ensure
the system correctness.

\*\*Glitches in Safety Critical Software\*\*

A safety critical software system’s sole purpose is to ensure safety. Having
said that, let’s look into history to find out scenarios where it failed to
serve the purpose.

\*Lion Air 737 MAX 8 crashed into the Java Sea off Indonesia,\*

This happened due to a “glitch” in the plane’s flight-control software. 189
passengers and crew were reported killed by the accident. Following the crash,
the Federal Aviation Administration (FAA) issued an emergency notice to
operators of Boeing 737 MAX 8 and 9 planes, warning that faulty angle of attack
sensor readings could cause the flight crew to have difficulty controlling the
airplane. And then it happened again. Ethiopian Airlines 737 MAX 8 went down
under similar circumstances, killing all 157 people aboard.

\<img src="/img/Dinithi_2.jpg" width="500" height="400" /\>

\*Chernobyl Disaster\*

In 1986 at the Chernobyl nuclear power station in the Soviet Union, the worst
disaster in the history of nuclear power generation. It happened as technicians
at reactor Unit 4 attempted a poorly designed experiment. The accident caused
the largest uncontrolled radioactive release into the environment ever recorded
for any civilian operation, and large quantities of radioactive substances were
released into the air for about 10 days. This caused serious social and economic
disruption for large populations in Belarus, Russia, and Ukraine.

\<img src="/img/Dinithi_3.jpg" width="500" height="400" /\>

\*The Explosion of the Ariane 5\*

On June 4, 1996 Ariane 5 was launched by the European Space Agency, exploded
just forty seconds after its lift-off. It turned out that the cause of the
failure was a software error in the inertial reference system. Specifically a 64
bit floating point number relating to the horizontal velocity of the rocket with
respect to the platform was converted to a 16 bit signed integer. The number was
larger than 32,767, the largest integer storable in a 16 bit signed integer, and
thus the conversion failed.

\<img src="/img/Dinithi_4.jpeg" width="500" height="400" /\>

\*\*How to avoid catastrophic failures?\*\*

Now that, you have seen, Software quality is a matter of life and death, let’s
find out how to build better safety critical software. People look for software
not only to have convenient life style but also to protect their life and ensure
safety. Organizations can ensure that if they concern on following facts.

• Architecture risk analysis during design

• Static analysis during development

• Interactive static application testing during testing/QA

• Dynamic analysis pre-release

Today, there are thousands of work related to designing more effective and
efficient safety-critical systems. Not only are our lives depending on doctors
and pilots, but also on engineers and programmers as well.

\*\*References\*\*

https://www.researchgate.net/publication/260055261_How_to_design_and_test_safety_critical_software_systems

https://www.synopsys.com/blogs/software-security/safety-critical-software/

https://www.world-nuclear.org/information-library/safety-and-security/safety-of-plants/chernobyl-accident.aspx

https://sites.google.com/site/cis115textbook/safety-critical-systems

http://www-users.math.umn.edu/\~arnold/disasters/ariane.html
